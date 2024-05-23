-- Taller 2 

------------------------------------------------------------- TALLER 2 PL / SQL -------------------------------------------------------------------

-- PUNTO 1 (Creación propia auxiliado por Gemini)
-- PARRA

CREATE OR REPLACE TRIGGER corregir_factura
BEFORE INSERT ON ITEMVENTA
FOR EACH ROW
DECLARE
    v_inventario NUMBER;
    v_precio_producto NUMBER;
BEGIN
    -- Obtener inventario y precio del producto
    SELECT i.CANTIDAD, p.PRECIO
    INTO v_inventario, v_precio_producto
    FROM INVENTARIOALMACEN i
    JOIN PRODUCTO p ON i.PRODUCTO_IDPRODUCTO = p.IDPRODUCTO
    WHERE i.ALMACEN_IDALMACEN = (
        SELECT ALMACEN_IDALMACEN
        FROM VENTA
        JOIN EMPLEADO ON VENTA.EMPLEADO_IDEMPLEADO = EMPLEADO.IDEMPLEADO
        WHERE VENTA.NUMERO = :NEW.VENTA_NUMERO
    )
    AND i.PRODUCTO_IDPRODUCTO = :NEW.PRODUCTO_IDPRODUCTO;

    -- Verificar inventario y calcular descuento (si es necesario)
    IF v_inventario < :NEW.cantidad THEN
        -- Lógica para calcular el descuento (no especificada en el trigger original)

        -- Actualizar venta
        UPDATE VENTA
        SET ESTADO = '0',
            TOTALVENTA = TOTALVENTA - (:NEW.CANTIDAD * v_precio_producto) -- Aplicar descuento si es necesario
        WHERE NUMERO = :NEW.VENTA_NUMERO;

        DBMS_OUTPUT.PUT_LINE('Inventario insuficiente. Venta anulada y descuento aplicado.');
    ELSIF v_inventario >= :NEW.cantidad THEN
        -- Realizar alguna acción si el inventario es suficiente (no especificada en el trigger original)
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Manejar el caso en que el producto no existe en el inventario
        DBMS_OUTPUT.PUT_LINE('El producto no existe en el inventario.');
        RAISE; -- Propagar la excepción para cancelar la inserción
END;
/

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- PUNTO 2 

/*
Cuando el cliente decide comprar la venta (estado = 1), se debe descontar del inventario del almacén,
    la cantidad comprada de cada producto, también se debe calcular el total de la venta, ingresar de
    manera automática la fecha de la compra, poner el estado de la compra en 1 y acumular los puntos obtenidos por el cliente.
*/
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

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- PUNTO 3

/*
Cuando un empleado anula, elimina o modifica una venta o detalle de la venta, se debe guardar un
registro en la tabla auditoria (fecha hora las del sistema, acción se refiere al tipo de operación
es decir “Modificar” o “eliminar”, idRegistro representa el 
*/

CREATE OR REPLACE TRIGGER anular_venta
AFTER UPDATE OR DELETE ON venta
FOR EACH ROW
DECLARE
    operacion_iniciada VARCHAR(30);
    regresar_cantidad_almacen NUMBER;
BEGIN
    IF UPDATING THEN
        operacion_iniciada := 'se quiso actualizar';
    ELSE
        operacion_iniciada := 'se quiso eliminar';
    END IF;

    INSERT INTO auditoria (fechaHora, accion, idRegistro)
    VALUES (SYSDATE, operacion_iniciada, :old.numero);

    IF DELETING THEN
        FOR item IN (SELECT * FROM itemVenta WHERE Venta_numero = :old.numero) LOOP
            regresar_cantidad_almacen := item.cantidad;

            UPDATE inventarioAlmacen
            SET cantidad = cantidad + regresar_cantidad_almacen
            WHERE Producto_idProducto = item.Producto_idProducto
            AND Almacen_idAlmacen = (SELECT Almacen_idAlmacen FROM Empleado WHERE idEmpleado = :old.Empleado_idEmpleado);
        END LOOP;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER anular_detalle_venta
AFTER UPDATE OR DELETE ON itemVenta
FOR EACH ROW
DECLARE
    operacion_iniciada VARCHAR(30);
    cambio_cantidad_almacen NUMBER;
BEGIN
    IF UPDATING THEN
        operacion_iniciada := 'se quiso actualizar';
        
        cambio_cantidad_almacen := :old.cantidad - :new.cantidad;
        
        UPDATE inventarioAlmacen
        SET cantidad = cantidad + cambio_cantidad_almacen
        WHERE Producto_idProducto = :old.Producto_idProducto
        AND Almacen_idAlmacen = (SELECT Almacen_idAlmacen FROM Empleado WHERE idEmpleado = (SELECT Empleado_idEmpleado FROM Venta WHERE numero = :old.Venta_numero));

        
    ELSIF DELETING THEN
        operacion_iniciada := 'se quiso eliminar';
        
        cambio_cantidad_almacen := :old.cantidad;
        
        UPDATE inventarioAlmacen
        SET cantidad = cantidad + cambio_cantidad_almacen
        WHERE Producto_idProducto = :old.Producto_idProducto
        AND Almacen_idAlmacen = (SELECT Almacen_idAlmacen FROM Empleado WHERE idEmpleado = (SELECT Empleado_idEmpleado FROM Venta WHERE numero = :old.Venta_numero));

    END IF;

    INSERT INTO auditoria (fechaHora, accion, idRegistro)
    VALUES (SYSDATE, operacion_iniciada, :old.Venta_numero);
END;
/



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- PUNTO 4
-- PARRA

/*
Cuando se anula un registro de itemVenta, se debe registrar en la tabla auditoria,
asimismo devolver al inventario la cantidad comprada de ese producto
*/

-- Ingresar el evento a auditoria.
-- Regresar la cantidad al inventario.


--Primero creamos una vista que nos auxcilie en el proceso de los triggers
-- Vista que representa
CREATE OR REPLACE VIEW VENTA_ALMANCEN AS
SELECT v.NUMERO as num_venta, a.IDALMACEN
FROM almacen a
        left join empleado e on (e.ALMACEN_IDALMACEN = a.IDALMACEN)
        join venta v on (v.CLIENTE_IDCLIENTE = e.IDEMPLEADO)


CREATE OR REPLACE TRIGGER decrementar_inventario
   AFTER DELETE
   on ITEMVENTA
   FOR EACH ROW
DECLARE
   inv_al INVENTARIOALMACEN%ROWTYPE;
BEGIN
   select *
   INTO inv_al
   from INVENTARIOALMACEN i
   WHERE i.ALMACEN_IDALMACEN =
         (select IDALMACEN FROM VENTA_ALMANCEN WHERE num_venta = :OLD.VENTA_NUMERO);
   UPDATE INVENTARIOALMACEN SET cantidad = (inv_al.CANTIDAD - :OLD.cantidad) WHERE ALMACEN_IDALMACEN = inv_al.ALMACEN_IDALMACEN;




   -- Insertamos el evento a la auditoria
   INSERT INTO AUDITORIA (IDEMPLEADO, FECHAHORA, ACCION, IDREGISTRO)
   VALUES (
           (select v.EMPLEADO_IDEMPLEADO from VENTA v JOIN ITEMVENTA i on (v.NUMERO = i.VENTA_NUMERO) where v.NUMERO = :OLD.venta_numero),
           SYSDATE,
           'Eliminado item de la venta ' || :OLD.venta_numero || '',
           :OLD.venta_numero
          );


end;


ALTER TABLE AUDITORIA ALTER COLUMN NRO NUMBER(10) AUTO INCREMENT, PRIMARY KEY ();


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- PUNTO 5

CREATE OR REPLACE TRIGGER actualizar_precios 
AFTER UPDATE ON producto
FOR EACH ROW
DECLARE
    cantidad_total NUMBER;
    diferencia_precio NUMBER;
BEGIN
    -- Cursor para iterar sobre las ventas no completadas que contienen el producto cuyo precio ha cambiado
    FOR venta IN (SELECT iv.Venta_numero, iv.cantidad
                  FROM itemVenta iv
                  JOIN Venta v ON iv.Venta_numero = v.numero
                  WHERE iv.Producto_idProducto = :new.idProducto
                  AND v.estado = '0') LOOP

        -- Calcular la diferencia en precio por la cantidad de productos en la venta
        diferencia_precio := venta.cantidad * (:new.precio - :old.precio);

        -- Actualizar el total de la venta
        UPDATE Venta
        SET totalVenta = totalVenta + diferencia_precio
        WHERE numero = venta.Venta_numero;
    END LOOP;
END;
/





