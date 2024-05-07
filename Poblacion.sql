-- Población de la tabla alumno
BEGIN
  FOR i IN 1..25 LOOP
    INSERT INTO alumno (nombre, apellido)
    VALUES ('Alumno' || i, 'Apellido' || i);
  END LOOP;
END;
/

-- Población de la tabla docente
BEGIN
  FOR i IN 1..25 LOOP
    INSERT INTO docente (nombre, apellido, identificacion)
    VALUES ('Docente' || i, 'Apellido' || i, 'ID' || LPAD(i, 6, '0'));
  END LOOP;
END;
/

-- Población de la tabla curso
BEGIN
  FOR i IN 1..25 LOOP
    INSERT INTO curso (nombre, descripcion)
    VALUES ('Curso' || i, 'Descripción del curso ' || i);
  END LOOP;
END;
/

-- Población de la tabla tema
BEGIN
  FOR i IN 1..25 LOOP
    INSERT INTO tema (titulo, descripcion)
    VALUES ('Tema' || i, 'Descripción del tema ' || i);
  END LOOP;
END;
/

-- Población de la tabla unidad
BEGIN
  FOR i IN 1..25 LOOP
    INSERT INTO unidad (titulo, descripcion, id_curso)
    VALUES ('Unidad' || i, 'Descripción de la unidad ' || i, MOD(i, 25) + 1);
  END LOOP;
END;
/

-- Población de la tabla bloque_horiario
BEGIN
  FOR i IN 1..25 LOOP
    INSERT INTO bloque_horiario (hora_inicio, hora_fin, lugar, dia)
    VALUES (SYSDATE + i / 24, SYSDATE + (i + 2) / 24, 'Lugar' || i, 'L');
  END LOOP;
END;
/

-- Población de la tabla pregunta
BEGIN
  FOR i IN 1..25 LOOP
    INSERT INTO pregunta (enunciado, es_publica, tipo_pregunta, id_tema, id_docente)
    VALUES ('Enunciado de la pregunta ' || i, 'S', 'Abierta', MOD(i, 25) + 1, DBMS_RANDOM.VALUE(6, 30));
  END LOOP;
END;
/

-- Población de la tabla respuesta
BEGIN
  FOR i IN 1..25 LOOP
    INSERT INTO respuesta (descripcion, es_verdadera, id_pregunta)
    VALUES ('Respuesta ' || i || ' a la pregunta ' || MOD(i, 25) + 1, 'a', MOD(i, 25) + 1);
  END LOOP;
END;
/

-- Población de la tabla grupo
BEGIN
  FOR i IN 1..25 LOOP
    INSERT INTO grupo (jornada, nombre, periodo, id_docente, id_curso)
    VALUES ('Diurna', 'Grupo' || i, '2023-2', DBMS_RANDOM.VALUE(6, 30), MOD(i, 25) + 1);
  END LOOP;
END;
/

-- Población de la tabla examen
BEGIN
  FOR i IN 1..25 LOOP
    INSERT INTO examen (tiempo_max, numero_preguntas, porcentaje_curso, nombre, fecha_hora_inicio, fecha_hora_fin, id_tema, id_docente, id_grupo)
    VALUES (120, 10, 20, 'Examen' || i, SYSDATE + i, SYSDATE + i + 1, MOD(i, 25) + 1, DBMS_RANDOM.VALUE(6, 30), MOD(i, 25) + 1);
  END LOOP;
END;
/

-- Población de la tabla alumno_grupo
BEGIN
  FOR i IN 1..40 LOOP
    INSERT INTO alumno_grupo (id_grupo, id_alumno)
    VALUES (MOD(i, 25) + 1, MOD(i, 25) + 1);
  END LOOP;
END;
/

-- Población de la tabla horario
BEGIN
  FOR i IN 1..40 LOOP
    INSERT INTO horario (id_bloque_horario, id_grupo)
    VALUES (MOD(i, 25) + 1, MOD(i, 25) + 1);
  END LOOP;
END;
/

-- Población de la tabla pregunta_examen
BEGIN
  FOR i IN 1..40 LOOP
    INSERT INTO pregunta_examen (procentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
    VALUES (10, 30, 'S', MOD(i, 25) + 1, MOD(i, 25) + 1);
  END LOOP;
END;
/

-- Población de la tabla presentacion_examen
BEGIN
  FOR i IN 1..40 LOOP
    INSERT INTO presentacion_examen (terminado, calificacion, id_examen, id_alumno)
    VALUES ('S', DBMS_RANDOM.VALUE(0, 100), MOD(i, 25) + 1, MOD(i, 25) + 1);
  END LOOP;
END;
/

-- Población de la tabla nota 
BEGIN 
 FOR i in 1..40 LOOP 
   INSERT INTO nota (valor, id_grupo, id_alumno) 
    VALUES (DBMS_RANDOM.VALUE(0, 5), MOD(i, 25) + 1, MOD(i, 25) + 1); 
 END LOOP;
END; 
/

-- Población de la tabla presentacion_pregunta
BEGIN
  FOR i IN 1..40 LOOP
    INSERT INTO presentacion_pregunta (respuesta_correcta, id_pregunta, id_respuesta, presentacion_examen_id_examen, presentacion_examen_id_alumno)
    VALUES ('N', MOD(i, 25) + 1, MOD(i, 25) + 1, MOD(i, 25) + 1, MOD(i, 25) + 1);
  END LOOP;
END;
/

COMMIT;