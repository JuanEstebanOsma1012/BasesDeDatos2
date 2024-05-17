-- Vista para obtener el rendimiento promedio por alumno y tema (finalidad de reportes)
CREATE OR REPLACE VIEW RendimientoAlumnoTema AS
SELECT n.id_alumno, t.id_tema, AVG(n.valor) as rendimiento
FROM nota n
JOIN alumno_grupo ag ON n.id_alumno = ag.id_alumno
JOIN grupo g ON ag.id_grupo = g.id_grupo
JOIN examen e ON g.id_grupo = e.id_grupo
JOIN tema t ON e.id_tema = t.id_tema
GROUP BY n.id_alumno, t.id_tema;
-- Esta vista permite obtener el rendimiento promedio de cada alumno en cada tema

-- Vista para calcular la duración de cada bloque horario (finalidad de reportes)
CREATE OR REPLACE VIEW DuracionBloqueHorario AS
SELECT id_bloque_horario, (TO_CHAR(hora_fin, 'hh') - TO_CHAR(hora_inicio, 'hh')) AS Duracion 
FROM bloque_horiario;
-- Esta vista permite obtener la duración de cada bloque horario sin tener que hacer la resta en cada consulta.

-- Vista de información básica del estudiante para el rol Estudiante (informacion del perfil) dependiendo del ID del estudiante, con informacion de los grupos a los que pertenece y los cursos de estos grupos
CREATE OR REPLACE VIEW InformacionBasicaEstudiante AS
SELECT a.id_alumno, g.nombre AS grupo, c.nombre AS curso
FROM alumno a
JOIN alumno_grupo ag ON a.id_alumno = ag.id_alumno
JOIN grupo g ON ag.id_grupo = g.id_grupo
JOIN curso c ON g.id_curso = c.id_curso;
-- Esta vista permite a los estudiantes consultar su información básica sin acceder a la tabla AlumnoGrupo directamente.

-- Vista de preguntas disponibles para el rol Docente
CREATE OR REPLACE VIEW V_PreguntasDisponibles AS
SELECT p.id_pregunta, p.enunciado, p.tipo_pregunta
FROM Pregunta p
WHERE p.es_publica = 'S';
-- Esta vista muestra las preguntas públicas a los docentes, ocultando las preguntas que no deben ser visibles.

-- Vista de exámenes disponibles para el rol Estudiante
CREATE OR REPLACE VIEW V_ExamenesDisponibles AS
SELECT e.id_examen, e.nombre, e.fecha_hora_inicio, e.fecha_hora_fin, c.nombre AS curso, g.nombre AS grupo
FROM Examen e
JOIN Grupo g ON e.id_grupo = g.id_grupo
JOIN Curso c ON g.id_curso = c.id_curso
WHERE e.estado = 'LIBERADO' AND e.fecha_hora_inicio <= SYSDATE AND e.fecha_hora_fin >= SYSDATE;
-- Esta vista muestra los exámenes disponibles para los estudiantes, incluyendo información relevante sobre el examen, el curso y el grupo

-- Vista para el administrador con información general del sistema
CREATE OR REPLACE VIEW V_InfoGeneral AS
SELECT 
    (SELECT COUNT(*) FROM Docente) AS total_docentes,
    (SELECT COUNT(*) FROM ALUMNO) AS total_alumnos,
    (SELECT COUNT(*) FROM Curso) AS total_cursos,
    (SELECT COUNT(*) FROM Examen) AS total_examenes;
-- Esta vista muestra información general del sistema para el administrador, como la cantidad de docentes, estudiantes, cursos y exámenes en el sistema.