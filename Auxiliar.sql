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

-- eliminar la base de datos completa, con datos y todo
DROP USER "C##PROYECTO_FINAL_PRUEBAS" CASCADE;