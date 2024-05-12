-- Crear Roles
CREATE ROLE DocenteRol;
CREATE ROLE EstudianteRol;
CREATE ROLE AdministradorRol;

-- Privilegios de Objeto

-- DocenteRol
GRANT INSERT, SELECT ON Respuesta TO DocenteRol;
GRANT SELECT, INSERT, UPDATE ON Pregunta TO DocenteRol;
GRANT INSERT, SELECT ON PreguntaExamen TO DocenteRol;
GRANT SELECT ON Tema TO DocenteRol;
GRANT INSERT, SELECT, UPDATE ON Examen TO DocenteRol;
GRANT SELECT ON Docente TO DocenteRol;
GRANT SELECT ON Curso TO DocenteRol;
GRANT SELECT ON Grupo TO DocenteRol;

-- EstudianteRol
GRANT SELECT ON Respuesta TO EstudianteRol;
GRANT SELECT ON Pregunta TO EstudianteRol;
GRANT SELECT ON PreguntaExamen TO EstudianteRol;
GRANT INSERT, UPDATE, SELECT ON PresentacionPregunta TO EstudianteRol;
GRANT SELECT ON Examen TO EstudianteRol;
GRANT INSERT, UPDATE, SELECT ON PresentacionExamen TO EstudianteRol;
GRANT SELECT ON AlumnoGrupo TO EstudianteRol;

-- AdministradorRol
GRANT SELECT, UPDATE, INSERT ON Docente TO AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Alumno TO AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Examen TO AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Pregunta TO AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Tema TO AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Respuesta TO AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Grupo TO AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON PresentacionExamen TO AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON PresentacionPregunta TO AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Curso TO AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Unidad TO AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON PreguntaExamen TO AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON BloqueHorario TO AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Horario TO AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON AlumnoGrupo TO AdministradorRol;
GRANT SELECT, UPDATE, INSERT ON Nota TO AdministradorRol;

-- Privilegios del Sistema

-- Todos los roles
GRANT CREATE SESSION TO DocenteRol, EstudianteRol, AdministradorRol;

-- Usuarios de Prueba

-- DocenteRol
CREATE USER DocenteRol_prueba IDENTIFIED BY DocenteRol123;
GRANT DocenteRol TO DocenteRol_prueba;

-- EstudianteRol
CREATE USER EstudianteRol_prueba IDENTIFIED BY EstudianteRol123;
GRANT EstudianteRol TO EstudianteRol_prueba;

-- AdministradorRol
CREATE USER admin_prueba IDENTIFIED BY admin123;
GRANT AdministradorRol TO admin_prueba;