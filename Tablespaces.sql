-- ESTO ES LO QUE DEBERIA FUNCIONAR PERO NO TENGO ESPACIO EN EL DISCO =)

-- Tablespace para docentes: asignado con espacio suficiente para el crecimiento de datos relacionados con docentes.
CREATE TABLESPACE docente
DATAFILE '/opt/oracle/oradata/tablespaces/docente.dat' 
-- SIZE 3231K -- necesita mas tamaño por el limite inferior de los bloques
SIZE 7000K
AUTOEXTEND ON 
NEXT 258K -- Incrementos para el autoextend que permiten un crecimiento progresivo sin intervención manual.
MAXSIZE 8381K; -- Sin límite para permitir la expansión conforme a las necesidades futuras.

-- Tablespace para estudiantes: similar al de docentes, pero enfocado en datos de estudiantes.
CREATE TABLESPACE alumno
DATAFILE '/opt/oracle/oradata/tablespaces/alumno.dat'
SIZE 63899K
AUTOEXTEND ON 
NEXT 5092K -- Incrementos adecuados para manejar el aumento esperado de registros de estudiantes.
MAXSIZE 165736K;

-- Tablespace para índices de docentes: menor que los de datos ya que los índices generalmente ocupan menos espacio.
CREATE TABLESPACE docente_idx
DATAFILE '/opt/oracle/oradata/tablespaces/docente_idx.dat'
SIZE 6462K -- Capacidad inicial basada en la estructura y cantidad de índices de docentes.
AUTOEXTEND ON 
NEXT 515K -- Incrementos para gestionar la adición de nuevos índices sin problemas.
MAXSIZE 16762K;

-- Tablespace para índices de estudiantes: configurado para soportar índices de las tablas de estudiantes.
CREATE TABLESPACE alumno_idx
DATAFILE '/opt/oracle/oradata/tablespaces/alumno_idx.dat'
SIZE 127797K -- Tamaño proyectado para índices, teniendo en cuenta el número y tamaño de los índices existentes.
AUTOEXTEND ON 
NEXT 10184K -- Ajustes para el autoextend que facilitan la administración de espacio de índices.
MAXSIZE 331473K;

-- Paso las tablas respectivas al tablespace correspondiente.

-- Paso las tablas respectivas al tablespace correspondiente.

ALTER TABLE docente MOVE TABLESPACE docente;
ALTER TABLE alumno MOVE TABLESPACE alumno;
ALTER TABLE examen MOVE TABLESPACE docente; 
ALTER TABLE pregunta_examen MOVE TABLESPACE docente;
ALTER TABLE bloque_horario MOVE TABLESPACE alumno;
ALTER TABLE horario MOVE TABLESPACE alumno;
ALTER TABLE alumno_grupo MOVE TABLESPACE alumno;
ALTER TABLE nota MOVE TABLESPACE alumno;
ALTER TABLE presentacion_examen MOVE TABLESPACE alumno;
ALTER TABLE presentacion_pregunta MOVE TABLESPACE alumno; 
ALTER TABLE curso MOVE TABLESPACE docente;
ALTER TABLE unidad MOVE TABLESPACE docente;
ALTER TABLE pregunta MOVE TABLESPACE docente;
ALTER TABLE tema MOVE TABLESPACE docente;
ALTER TABLE respuesta MOVE TABLESPACE docente;
ALTER TABLE grupo MOVE TABLESPACE docente;

-- Indices
ALTER INDEX docente_identificacion_idx REBUILD TABLESPACE docente_idx;
ALTER INDEX docente_nombre_idx REBUILD TABLESPACE docente_idx;
ALTER INDEX docente_apellido_idx REBUILD TABLESPACE docente_idx;
ALTER INDEX alumno_nombre_idx REBUILD TABLESPACE alumno_idx;
ALTER INDEX examen_fecha_hora_inicio_idx REBUILD TABLESPACE docente_idx;
ALTER INDEX examen_fecha_hora_fin_idx REBUILD TABLESPACE docente_idx;
ALTER INDEX bh_hora_inicio_idx REBUILD TABLESPACE alumno_idx;
ALTER INDEX bh_hora_fin_idx REBUILD TABLESPACE alumno_idx;
ALTER INDEX bh_dia_idx REBUILD TABLESPACE alumno_idx;
ALTER INDEX pe_fecha_hora_presentacion_idx REBUILD TABLESPACE alumno_idx;
ALTER INDEX pe_calificacion_idx REBUILD TABLESPACE alumno_idx;
ALTER INDEX pe_terminado_idx REBUILD TABLESPACE alumno_idx;
ALTER INDEX respuesta_es_verdadera_idx REBUILD TABLESPACE docente_idx;
ALTER INDEX tema_titulo_idx REBUILD TABLESPACE docente_idx;

-- Asigno el PCTFREE a 30 para las tablas de actualizacion constante (alumno_grupo, bloque_usuario, curso)

ALTER TABLE alumno_grupo PCTFREE 30;
ALTER TABLE bloque_horario PCTFREE 30;
ALTER TABLE curso PCTFREE 30;

-- Asigno el PCTFREE a 10 para las demás tablas

ALTER TABLE examen PCTFREE 10;
ALTER TABLE grupo PCTFREE 10;
ALTER TABLE horario PCTFREE 10;
ALTER TABLE nota PCTFREE 10;
ALTER TABLE pregunta PCTFREE 10;
ALTER TABLE pregunta_examen PCTFREE 10;
ALTER TABLE presentacion_examen PCTFREE 10;
ALTER TABLE presentacion_pregunta PCTFREE 10;
ALTER TABLE respuesta PCTFREE 10;
ALTER TABLE tema PCTFREE 10;
ALTER TABLE unidad PCTFREE 10;
ALTER TABLE docente PCTFREE 10;
ALTER TABLE alumno PCTFREE 10;

-- Los primeros campos de cada tabla deben ser aquellos campos requeridos y dentro de los requeridos primero se definen los de longitud fija y después los de longitud variable.