--  Reporte de rendimiento promedio por tema y docente, por tema y general
SELECT 
    t.titulo AS Tema, 
    d.nombre || ' ' || d.apellido AS Docente, 
    AVG(rat.rendimiento) AS RendimientoPromedio,
    CASE 
        WHEN AVG(rat.rendimiento) BETWEEN 0.0 AND 3.0 THEN 'Bajo'
        WHEN AVG(rat.rendimiento) BETWEEN 3.0 AND 4.0 THEN 'Medio'
        WHEN AVG(rat.rendimiento) BETWEEN 4.0 AND 5.0 THEN 'Alto'
        ELSE 'N/A'
    END AS NivelRendimiento
FROM RendimientoAlumnoTema rat
JOIN tema t ON rat.id_tema = t.id_tema
JOIN examen e ON t.id_tema = e.id_tema
JOIN docente d ON e.id_docente = d.id_docente
GROUP BY ROLLUP (t.titulo, d.nombre || ' ' || d.apellido);

-- Reporte de calificaciones por trimestre del año inmediatamente anterior
SELECT *
FROM (
  SELECT pe.id_alumno,
         pe.calificacion,
         CASE 
             WHEN TO_CHAR(e.fecha_hora_fin, 'mm') BETWEEN 1 AND 3 THEN 'Trimestre1'
             WHEN TO_CHAR(e.fecha_hora_fin, 'mm') BETWEEN 4 AND 6 THEN 'Trimestre2'
             WHEN TO_CHAR(e.fecha_hora_fin, 'mm') BETWEEN 7 AND 9 THEN 'Trimestre3'
             WHEN TO_CHAR(e.fecha_hora_fin, 'mm') BETWEEN 10 AND 12 THEN 'Trimestre4'
         END AS Trimestre
  FROM presentacion_examen pe
  JOIN examen e ON pe.id_examen = e.id_examen
  WHERE e.fecha_hora_fin BETWEEN TRUNC(SYSDATE, 'YEAR') - INTERVAL '1' YEAR AND TRUNC(SYSDATE, 'YEAR') - INTERVAL '1' DAY 
)
PIVOT (
  AVG(calificacion)
  FOR Trimestre IN (
    'Trimestre1' AS Trimestre1,
    'Trimestre2' AS Trimestre2,
    'Trimestre3' AS Trimestre3,
    'Trimestre4' AS Trimestre4
  )
)
ORDER BY id_alumno;


-- Cantidad de preguntas por tema y profesor, por tema, por profesor y en general
SELECT 
    t.titulo AS Tema, 
    d.nombre || ' ' || d.apellido AS Docente, 
    COUNT(p.id_pregunta) AS CantidadPreguntas 
FROM pregunta p
JOIN tema t ON p.id_tema = t.id_tema
JOIN docente d ON p.id_docente = d.id_docente
GROUP BY GROUPING SETS (t.titulo, d.nombre || ' ' || d.apellido, ());

-- Cantidad de horas promedio al día de trabajo de cada docente
SELECT 
    d.nombre || ' ' || d.apellido AS Docente, 
    ROUND(AVG(dbh.Duracion),2) AS HorasPromedioDia
FROM docente d
JOIN grupo g ON d.id_docente = g.id_docente
JOIN horario h ON g.id_grupo = h.id_grupo
JOIN DuracionBloqueHorario dbh ON h.id_bloque_horario = dbh.id_bloque_horario
GROUP BY d.nombre || ' ' || d.apellido;

-- Cantidad de exámenes no terminados por estudiante y grupo, por grupo, por estudiante y en general
SELECT 
    a.nombre || ' ' || a.apellido AS Estudiante, 
    g.nombre AS Grupo, 
    COUNT(pe.id_examen) AS ExamenesNoTerminados 
FROM alumno a
JOIN alumno_grupo ag ON a.id_alumno = ag.id_alumno
JOIN grupo g ON ag.id_grupo = g.id_grupo
LEFT JOIN presentacion_examen pe ON a.id_alumno = pe.id_alumno AND g.id_grupo = pe.id_examen AND pe.terminado = 'N'
GROUP BY GROUPING SETS (a.nombre || ' ' || a.apellido, g.nombre, ());