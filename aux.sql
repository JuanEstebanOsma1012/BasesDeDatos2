CREATE USER "C##PROYECTO_FINAL_PRUEBAS" IDENTIFIED BY "proyecto_final_pruebas";
GRANT CONNECT, RESOURCE TO "C##PROYECTO_FINAL_PRUEBAS";

-- dar rol de dba a usuario
GRANT DBA TO "C##PROYECTO_FINAL_PRUEBAS";

SELECT DBMS_SPACE_ESTIMATE.SPACE_REQUIRED (
  table_name => 'docente',
  object_type => 'TABLE',
  data => 'hola mundo'
);

-- create an example register for each table
INSERT INTO docente (nombre, apellido, identificacion) VALUES ('qwertyuiopasdfghjklñzxcvbnmqwertyuiopasdfghjklñzxcvbnmqwertyu', 'qwertyuiopasdfghjklñzxcvbnmqwertyuiopasdfghjklñzxcvbnmqwertyu', '1234567890123456789012345678901');
DELETE FROM docente WHERE identificacion = '1234567890123456789012345678901';
SELECT * FROM docente WHERE identificacion = '1234567890123456789012345678901';
