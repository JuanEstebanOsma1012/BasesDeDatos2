-- Crear Roles
CREATE ROLE C##DocenteRol;
CREATE ROLE C##EstudianteRol;
CREATE ROLE C##AdministradorRol;

-- Privilegios de Objeto

-- C##DocenteRol
GRANT INSERT, SELECT ON Respuesta TO C##DocenteRol;
GRANT SELECT, INSERT, UPDATE ON Pregunta TO C##DocenteRol;
GRANT INSERT, SELECT ON Pregunta_Examen TO C##DocenteRol;
GRANT SELECT ON Tema TO C##DocenteRol;
GRANT INSERT, SELECT, UPDATE ON Examen TO C##DocenteRol;
GRANT SELECT ON Docente TO C##DocenteRol;
GRANT SELECT ON Curso TO C##DocenteRol;
GRANT SELECT ON Grupo TO C##DocenteRol;

-- C##EstudianteRol
GRANT SELECT ON Respuesta TO C##EstudianteRol;
GRANT SELECT ON Pregunta TO C##EstudianteRol;
GRANT SELECT ON Pregunta_Examen TO C##EstudianteRol;
GRANT INSERT, UPDATE, SELECT ON Presentacion_Pregunta TO C##EstudianteRol;
GRANT SELECT ON Examen TO C##EstudianteRol;
GRANT INSERT, UPDATE, SELECT ON Presentacion_Examen TO C##EstudianteRol;
GRANT SELECT ON Alumno_Grupo TO C##EstudianteRol;

-- C##AdministradorRol
GRANT SELECT, UPDATE, INSERT ON Docente TO C##AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Alumno TO C##AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Examen TO C##AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Pregunta TO C##AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Tema TO C##AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Respuesta TO C##AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Grupo TO C##AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Presentacion_Examen TO C##AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Presentacion_Pregunta TO C##AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Curso TO C##AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Unidad TO C##AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Pregunta_Examen TO C##AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Bloque_Horiario TO C##AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Horario TO C##AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Alumno_Grupo TO C##AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Nota TO C##AdministradorRol;

-- Privilegios del Sistema

-- Todos los roles
GRANT CREATE SESSION TO C##DocenteRol, C##EstudianteRol, C##AdministradorRol;

-- Usuarios de Prueba

-- C##DocenteRol
CREATE USER C##DocenteRol_prueba IDENTIFIED BY C##DocenteRol123;
GRANT C##DocenteRol TO C##DocenteRol_prueba;

-- C##EstudianteRol
CREATE USER C##EstudianteRol_prueba IDENTIFIED BY C##EstudianteRol123;
GRANT C##EstudianteRol TO C##EstudianteRol_prueba;

-- C##AdministradorRol
CREATE USER admin_prueba IDENTIFIED BY admin123;
GRANT C##AdministradorRol TO admin_prueba;