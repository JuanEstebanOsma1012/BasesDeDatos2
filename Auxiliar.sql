CREATE USER "C##PROYECTO_FINAL_PRUEBAS" IDENTIFIED BY "proyecto_final_pruebas";
GRANT CONNECT, RESOURCE TO "C##PROYECTO_FINAL_PRUEBAS";

-- dar rol de dba a usuario
GRANT DBA TO "C##PROYECTO_FINAL_PRUEBAS";

-- create an example register for each table
INSERT INTO docente (nombre, apellido, identificacion) VALUES ('qwertyuiopasdfghjklñzxcvbnmqwertyuiopasdfghjklñzxcvbnmqwertyu', 'qwertyuiopasdfghjklñzxcvbnmqwertyuiopasdfghjklñzxcvbnmqwertyu', '1234567890123456789012345678901');
DELETE FROM docente WHERE identificacion = '1234567890123456789012345678901';
SELECT * FROM docente WHERE identificacion = '1234567890123456789012345678901';

-- ----------------------------- desde aquí empieza el taller de Triggers que puso Triviño para una "entrega parcial" del parcial ------------------------------

-- Cree un disparador que garantice que un examen no puede ser modificado si existe algún alumno que ya lo presentó

CREATE OR REPLACE TRIGGER evitar_modificacion_examen_presentado
BEFORE UPDATE ON examen
FOR EACH ROW
DECLARE
  v_presentaciones_existentes INTEGER;
BEGIN
  SELECT COUNT(*) INTO v_presentaciones_existentes
  FROM presentacion_examen
  WHERE id_examen = :OLD.id_examen;

  IF v_presentaciones_existentes > 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'No se puede modificar el examen porque ya ha sido presentado por alumnos.');
  END IF;
END;

-- cree un disparador que cuando cree el examen inserte de forma aleatoria las n preguntas que requiera

CREATE OR REPLACE TRIGGER insertar_preguntas_aleatorias
AFTER INSERT ON examen
FOR EACH ROW
DECLARE
  v_preguntas_disponibles INTEGER;
  v_pregunta_seleccionada INTEGER;
BEGIN
  SELECT COUNT(*) INTO v_preguntas_disponibles
  FROM pregunta
  WHERE id_tema = :NEW.id_tema AND es_publica = 'S';

  FOR i IN 1..:NEW.numero_preguntas LOOP
    v_pregunta_seleccionada := DBMS_RANDOM.VALUE(1, v_preguntas_disponibles);

    INSERT INTO pregunta_examen (id_examen, id_pregunta, tiene_tiempo_maximo)
    SELECT :NEW.id_examen, id_pregunta, 'S'
    FROM (
      SELECT * FROM (
        SELECT id_pregunta
        FROM pregunta
        WHERE id_tema = :NEW.id_tema AND es_publica = 'S'
        MINUS
        SELECT id_pregunta
        FROM pregunta
        WHERE id_tema = :NEW.id_tema AND es_publica = 'S' AND id_pregunta IN (
          SELECT id_pregunta
          FROM pregunta_examen
          WHERE id_examen = :NEW.id_examen
        )
      ) ORDER BY DBMS_RANDOM.RANDOM
    )
    WHERE ROWNUM = v_pregunta_seleccionada;
  END LOOP;
END;

-- cree un disparador que establezca la fecha y hora en la cual el alumno empezó a realizar el examen.

CREATE OR REPLACE TRIGGER registrar_fecha_hora_inicio_examen
BEFORE INSERT ON presentacion_examen
FOR EACH ROW
BEGIN
  :NEW.fecha_presentacion := SYSDATE;
END;

------------------------------------------------------------- TALLER 2 PL / SQL -------------------------------------------------------------------

-- Cree un disparador que cree el historial de trabajo cuando un empleado cambie de departamento o de trabajo
-- test missing

CREATE OR REPLACE TRIGGER crear_historial
AFTER UPDATE OF department_id, job_id ON employees
FOR EACH ROW
DECLARE
BEGIN

    IF :NEW.department_id = :OLD.department_id AND :NEW.job_id = :OLD.job_id THEN
        RAISE_APPLICATION_ERROR(-20001, 'el departamento, trabajo o ambos que está intentando actualizar es el mismo que ya tenia el empleado, no es necesario hacer una nueva entrada en el historial de trabajos');
    END IF;
    
    INSERT INTO job_history VALUES (:OLD.employee_id, :OLD.hire_date, SYSDATE - 1, :OLD.job_id, :OLD.department_id);
    :NEW.hire_date := SYSDATE;

END;

-- Cree un disparador que permita insertar un empleado solo si el departamento tiene presupuesto para contratarlo, para saber esto, una vez insertado el empleado se debe disminuir el valor del presupuesto.
-- test missing

CREATE OR REPLACE TRIGGER validar_presupuesto
BEFORE INSERT ON employees
FOR EACH ROW
DECLARE
    presupuesto departments.presupuesto%TYPE;
BEGIN

    SELECT presupuesto INTO presupuesto
    FROM departments
    WHERE department_id = :NEW.department_id;

    IF presupuesto < :NEW.salary THEN
        RAISE_APPLICATION_ERROR(-20002, 'el departamento no tiene suficiente presupuesto para contratar a este empleado');
    END IF;
    
    UPDATE departments SET presupuesto = presupuesto - :NEW.salary;

END;

-- Realice un disparador que al cambiar de salario al empleado actualice el presupuesto del departamento
-- test missing

CREATE OR REPLACE TRIGGER actualizar_presupuesto_departamento
AFTER UPDATE OF salary ON employees
FOR EACH ROW
BEGIN

    UPDATE departments SET presupuesto = presupuesto + :OLD.salary - :NEW.salary;

END;

-- Cree un procedimiento que reciba código del país, el nombre del país y el nombre de la región. El procedimiento debe permitir insertar un país, si el nombre de la región no existe debe crear la región y el país.
-- test missing

CREATE OR REPLACE PROCEDURE insertar_pais (
    codigo_pais IN countries.country_id%TYPE,
    nombre_pais IN countries.country_name%TYPE,
    nombre_region IN regions.region_name%TYPE
) IS
    
    existe_region INTEGER;
    last_region_id INTEGER;
    new_region_id INTEGER;
    
BEGIN

    SELECT COUNT(*) INTO existe_region FROM regions WHERE region_name = nombre_region;
    
    IF existe_region = 0 THEN
        
        SELECT MAX(region_id) INTO last_region_id FROM regions;
        
        new_region_id := last_region_id + 1;

        INSERT INTO regions VALUES (new_region_id, nombre_region);
        
    ELSE

        SELECT region_id INTO new_region_id FROM regions WHERE region_name = nombre_region;

    END IF;

    INSERT INTO countries VALUES (codigo_pais, nombre_pais, new_region_id);
    
END;

-- Cree una función que dada el código de la ciudad calcule el máximo salario en esa ciudad,luego cree una consulta que muestre
-- por ciudad el empleado con mayor salario, debe usar esta función dentro de la consulta.

CREATE OR REPLACE FUNCTION maximo_salario_ciudad (
    nombre_ciudad IN locations.city%TYPE
) RETURN employees.salary%TYPE
IS
    maximo_salario employees.salary%TYPE;
BEGIN

    SELECT MAX(em.salary) INTO maximo_salario FROM employees em
    JOIN departments de ON em.department_id = de.department_id
    JOIN locations lo ON de.location_id = lo.location_id
    WHERE lo.city = nombre_ciudad;
    
    RETURN maximo_salario;

END maximo_salario_ciudad;

SELECT lo.city, em.first_name, em.last_name, em.salary FROM locations lo
JOIN departments de ON lo.location_id = de.location_id
JOIN employees em ON de.department_id = em.department_id
WHERE em.salary = maximo_salario_ciudad(lo.city);

-- Cree un disparador que permita modificar un jefe de un empleado, debe validar que una
-- persona puede tenar máximo 4 subordinados y que estos deben estar en el mismo
-- departamento que él.
-- test missing

CREATE OR REPLACE TRIGGER maximo_4_subordinados
BEFORE UPDATE OF department_id, manager_id ON employees
FOR EACH ROW
DECLARE
    cantidad_empleados INTEGER;
    id_departamento_jefe employees.employee_id%TYPE;
BEGIN

    SELECT COUNT(*) INTO cantidad_empleados FROM employees WHERE manager_id = :NEW.manager_id;
    IF cantidad_empleados > 4 THEN
        RAISE_APPLICATION_ERROR(-20003, 'el jefe que está intentando asignar al empleado ya tiene 4 o mas empleados, no es posible hacer la actualizacion');
    END IF;
    
    SELECT department_id INTO id_departamento_jefe FROM employees WHERE manager_id = :NEW.manager_id;
    IF id_departamento_jefe <> :NEW.department_id THEN
        RAISE_APPLICATION_ERROR(-20004, 'el departamento que le está intentando asignar no corresponde al departamento del deje, operacion fallida');
    END IF;

END;

ALTER TABLE departments DROP COLUMN presupuesto;
ALTER TABLE departments ADD resupuesto NUMBER(8,2) DEFAULT 10000;

------------------------------------------------------------- TALLER DISPARADORES -------------------------------------------------------------------

--Cuando un producto es agregado a la venta de un cliente, se debe verificar si hay inventario suficiente en el almacén, 
--en caso de no haberlo se debe anular ese registro (en estado guardar un 0) y 
--calcular el descuento ese producto. 
-- test missing





--Cuando el cliente decide comprar la venta (estado = 1), se debe descontar del inventario del almacén, la cantidad comprada de cada producto, 
--también se debe calcular el total de la venta, ingresar de manera automática la fecha de la compra, poner el estado de la compra en 1
--y acumular los puntos obtenidos por el cliente.
-- test missing

CREATE OR REPLACE TRIGGER trg_update_inventory_calculate_total
AFTER UPDATE OF estado ON Venta
FOR EACH ROW
WHEN (NEW.estado = '1')
DECLARE
    v_total NUMBER := 0;
    v_puntos INTEGER;
BEGIN

 -- Actualizar inventario
    FOR r IN (SELECT iv.Producto_idProducto, iv.cantidad, ia.Almacen_idAlmacen
              FROM itemVenta iv
              JOIN inventarioAlmacen ia ON iv.Producto_idProducto = ia.Producto_idProducto
              WHERE iv.Venta_numero = :NEW.numero) LOOP
        UPDATE inventarioAlmacen
        SET cantidad = cantidad - r.cantidad
        WHERE Producto_idProducto = r.Producto_idProducto
          AND Almacen_idAlmacen = r.Almacen_idAlmacen;
    END LOOP;

 -- Calcular el total de la venta
    FOR r IN (SELECT iv.cantidad, p.precio, iv.descuento
              FROM itemVenta iv
              JOIN Producto p ON iv.Producto_idProducto = p.idProducto
              WHERE iv.Venta_numero = :NEW.numero) LOOP
        v_total := v_total + (r.cantidad * r.precio * (1 - r.descuento / 100));
    END LOOP;

  -- Actualizar totalVenta y fecha de la venta
    UPDATE Venta
    SET totalVenta = v_total,
        fecha = SYSDATE
    WHERE numero = :NEW.numero;

 -- Acumular puntos al cliente
    v_puntos := v_total / 10; -- Asumiendo que 1 punto se gana por cada 10 unidades de la moneda gastadas
    UPDATE tarjetaCliente
    SET puntos = puntos + v_puntos
    WHERE numero = (SELECT tarjetaCliente FROM Cliente WHERE idCliente = :NEW.Cliente_idCliente);
END;

--Cuando un empleado anula, elimina o modifica una venta o detalle de la venta, 
--se debe guardar un registro en la tabla auditoria (fecha hora las del sistema, 
--acción se refiere al tipo de operación es decir “Modificar” o “eliminar”, idRegistro representa el número de la venta), 
--en caso de eliminar o anular la venta se debe retornar al inventario la cantidad de cada producto relacionado a esa venta.
-- test missing


--Cuando se anula un registro de itemVenta, se debe registrar en la tabla auditoria, 
--asimismo devolver al inventario la cantidad comprada de ese producto
-- test missing


--Cuando se modifique el precio de un producto, se debe actualizar el precio de los productos de las ventas y el total de la ventas, 
--de aquellas que no se han comprado (estado = 0) .


-- eliminar los datos de todas las tablas