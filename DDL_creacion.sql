CREATE TABLE alumno (
    id_alumno INTEGER NOT NULL,
    nombre    VARCHAR2(63) NOT NULL,
    apellido  VARCHAR2(63) NOT NULL
);

CREATE INDEX alumno_nombre_idx ON
    alumno (
        nombre
    ASC );

ALTER TABLE alumno ADD CONSTRAINT alumno_pk PRIMARY KEY ( id_alumno );

CREATE TABLE alumno_grupo (
    id_grupo  INTEGER NOT NULL,
    id_alumno INTEGER NOT NULL
);

ALTER TABLE alumno_grupo ADD CONSTRAINT alumno_grupo_pk PRIMARY KEY ( id_grupo,
                                                                      id_alumno );

CREATE TABLE bloque_horiario (
    id_bloque_horario INTEGER NOT NULL,
    hora_inicio       TIMESTAMP NOT NULL,
    hora_fin          TIMESTAMP NOT NULL,
    lugar             VARCHAR2(63) NOT NULL,
    dia               CHAR(1) NOT NULL
);

CREATE INDEX bh_hora_inicio_idx ON
    bloque_horiario (
        hora_inicio
    ASC );

CREATE INDEX bh_hora_fin_idx ON
    bloque_horiario (
        hora_fin
    ASC );

CREATE INDEX bh_dia_idx ON
    bloque_horiario (
        dia
    ASC );

ALTER TABLE bloque_horiario ADD CONSTRAINT bloque_horiario_pk PRIMARY KEY ( id_bloque_horario );

CREATE TABLE curso (
    id_curso    INTEGER NOT NULL,
    nombre      VARCHAR2(31) NOT NULL,
    descripcion VARCHAR2(255)
);

ALTER TABLE curso ADD CONSTRAINT curso_pk PRIMARY KEY ( id_curso );

CREATE TABLE docente (
    id_docente     INTEGER NOT NULL,
    nombre         VARCHAR2(63) NOT NULL,
    apellido       VARCHAR2(63) NOT NULL,
    identificacion VARCHAR2(31) NOT NULL
);

CREATE INDEX docente_identificacion_idx ON
    docente (
        identificacion
    ASC );

CREATE INDEX docente_nombre_idx ON
    docente (
        nombre
    ASC );

CREATE INDEX docente_apellido_idx ON
    docente (
        apellido
    ASC );

ALTER TABLE docente ADD CONSTRAINT docente_pk PRIMARY KEY ( id_docente );

CREATE TABLE examen (
    id_examen                INTEGER NOT NULL,
    tiempo_max               INTEGER DEFAULT 120 NOT NULL,
    numero_preguntas         INTEGER NOT NULL,
    porcentaje_curso         INTEGER NOT NULL,
    nombre                   VARCHAR2(63),
    porcentaje_aprobatorio   INTEGER DEFAULT 60 NOT NULL,
    fecha_hora_inicio        DATE NOT NULL,
    fecha_hora_fin           DATE NOT NULL,
    num_preguntas_aleatorias INTEGER,
    id_tema                  INTEGER NOT NULL,
    id_docente               INTEGER NOT NULL,
    id_grupo                 INTEGER NOT NULL,
    estado                   VARCHAR2(15) NOT NULL
);

CREATE INDEX examen_fecha_hora_inicio_idx ON
    examen (
        fecha_hora_inicio
    ASC );

CREATE INDEX examen_fecha_hora_fin_idx ON
    examen (
        fecha_hora_fin
    ASC );

ALTER TABLE examen ADD CONSTRAINT examen_pk PRIMARY KEY ( id_examen );

CREATE TABLE grupo (
    id_grupo   INTEGER NOT NULL,
    jornada    VARCHAR2(15) NOT NULL,
    nombre     VARCHAR2(15) NOT NULL,
    periodo    VARCHAR2(31) NOT NULL,
    id_docente INTEGER NOT NULL,
    id_curso   INTEGER NOT NULL
);

ALTER TABLE grupo ADD CONSTRAINT grupo_pk PRIMARY KEY ( id_grupo );

CREATE TABLE horario (
    id_bloque_horario INTEGER NOT NULL,
    id_grupo          INTEGER NOT NULL
);

ALTER TABLE horario ADD CONSTRAINT horario_pk PRIMARY KEY ( id_bloque_horario,
                                                            id_grupo );

CREATE TABLE nota (
    valor     FLOAT,
    id_grupo  INTEGER NOT NULL,
    id_alumno INTEGER NOT NULL
);

CREATE TABLE pregunta (
    id_pregunta           INTEGER NOT NULL,
    enunciado             VARCHAR2(256 BYTE) NOT NULL,
    es_publica            CHAR(1) NOT NULL,
    tipo_pregunta         VARCHAR2(32) NOT NULL,
    id_pregunta_compuesta INTEGER,
    id_tema               INTEGER NOT NULL,
    id_docente            INTEGER NOT NULL,
    estado                VARCHAR2(15) NOT NULL
);

CREATE INDEX pregunta_tipo_pregunta_idx ON
    pregunta (
        tipo_pregunta
    ASC );

ALTER TABLE pregunta ADD CONSTRAINT pregunta_pk PRIMARY KEY ( id_pregunta );

CREATE TABLE pregunta_examen (
    procentaje_examen   INTEGER,
    tiempo_pregunta     INTEGER,
    tiene_tiempo_maximo CHAR(1) NOT NULL,
    id_pregunta         INTEGER NOT NULL,
    id_examen           INTEGER NOT NULL
);

ALTER TABLE pregunta_examen ADD CONSTRAINT pregunta_examen_pk PRIMARY KEY ( id_pregunta,
                                                                            id_examen );

CREATE TABLE presentacion_examen (
    tiempo                  INTEGER,
    terminado               CHAR(1) NOT NULL,
    calificacion            FLOAT,
    ip_source               VARCHAR2(15),
    fecha_hora_presentacion DATE,
    id_examen               INTEGER NOT NULL,
    id_alumno               INTEGER NOT NULL,
    id_presentacion_examen  INTEGER NOT NULL
);

CREATE INDEX pe_fecha_hora_presentacion_idx ON
    presentacion_examen (
        fecha_hora_presentacion
    ASC );

CREATE INDEX pe_calificacion_idx ON
    presentacion_examen (
        calificacion
    ASC );

CREATE INDEX pe_terminado_idx ON
    presentacion_examen (
        terminado
    ASC );

ALTER TABLE presentacion_examen ADD CONSTRAINT presentacion_examen_pk PRIMARY KEY ( id_presentacion_examen );

CREATE TABLE presentacion_pregunta (
    respuesta_correcta       CHAR(1) NOT NULL,
    id_pregunta              INTEGER NOT NULL,
    id_respuesta             INTEGER,
    id_presentacion_pregunta INTEGER NOT NULL,
    id_presentacion_examen   INTEGER NOT NULL
);

ALTER TABLE presentacion_pregunta ADD CONSTRAINT presentacion_pregunta_pk PRIMARY KEY ( id_presentacion_pregunta );

CREATE TABLE respuesta (
    id_respuesta INTEGER NOT NULL,
    descripcion  VARCHAR2(256 BYTE) NOT NULL,
    es_verdadera CHAR(1) NOT NULL,
    id_pregunta  INTEGER NOT NULL
);

CREATE INDEX respuesta_es_verdadera_idx ON
    respuesta (
        es_verdadera
    ASC );

ALTER TABLE respuesta ADD CONSTRAINT respuesta_pk PRIMARY KEY ( id_respuesta );

CREATE TABLE tema (
    id_tema     INTEGER NOT NULL,
    titulo      VARCHAR2(63) NOT NULL,
    descripcion VARCHAR2(255)
);

CREATE INDEX tema_titulo_idx ON
    tema (
        titulo
    ASC );

ALTER TABLE tema ADD CONSTRAINT tema_pk PRIMARY KEY ( id_tema );

CREATE TABLE unidad (
    id_unidad   INTEGER NOT NULL,
    titulo      VARCHAR2(31) NOT NULL,
    descripcion VARCHAR2(255),
    id_curso    INTEGER NOT NULL
);

ALTER TABLE unidad ADD CONSTRAINT unidad_pk PRIMARY KEY ( id_unidad );

ALTER TABLE alumno_grupo
    ADD CONSTRAINT alumno_grupo_alumno_fk FOREIGN KEY ( id_alumno )
        REFERENCES alumno ( id_alumno );

ALTER TABLE alumno_grupo
    ADD CONSTRAINT alumno_grupo_grupo_fk FOREIGN KEY ( id_grupo )
        REFERENCES grupo ( id_grupo );

ALTER TABLE examen
    ADD CONSTRAINT examen_docente_fk FOREIGN KEY ( id_docente )
        REFERENCES docente ( id_docente );

ALTER TABLE examen
    ADD CONSTRAINT examen_grupo_fk FOREIGN KEY ( id_grupo )
        REFERENCES grupo ( id_grupo );

ALTER TABLE examen
    ADD CONSTRAINT examen_tema_fk FOREIGN KEY ( id_tema )
        REFERENCES tema ( id_tema );

ALTER TABLE grupo
    ADD CONSTRAINT grupo_curso_fk FOREIGN KEY ( id_curso )
        REFERENCES curso ( id_curso );

ALTER TABLE grupo
    ADD CONSTRAINT grupo_docente_fk FOREIGN KEY ( id_docente )
        REFERENCES docente ( id_docente );

ALTER TABLE horario
    ADD CONSTRAINT horario_bloque_horiario_fk FOREIGN KEY ( id_bloque_horario )
        REFERENCES bloque_horiario ( id_bloque_horario );

ALTER TABLE horario
    ADD CONSTRAINT horario_grupo_fk FOREIGN KEY ( id_grupo )
        REFERENCES grupo ( id_grupo );

ALTER TABLE pregunta
    ADD CONSTRAINT id_pregunta_compuesta FOREIGN KEY ( id_pregunta_compuesta )
        REFERENCES pregunta ( id_pregunta );

ALTER TABLE nota
    ADD CONSTRAINT nota_alumno_fk FOREIGN KEY ( id_alumno )
        REFERENCES alumno ( id_alumno );

ALTER TABLE nota
    ADD CONSTRAINT nota_grupo_fk FOREIGN KEY ( id_grupo )
        REFERENCES grupo ( id_grupo );

ALTER TABLE presentacion_pregunta
    ADD CONSTRAINT pp_pregunta_fk FOREIGN KEY ( id_pregunta )
        REFERENCES pregunta ( id_pregunta );

ALTER TABLE presentacion_pregunta
    ADD CONSTRAINT pp_presentacion_examen_fk FOREIGN KEY ( id_presentacion_examen )
        REFERENCES presentacion_examen ( id_presentacion_examen );

ALTER TABLE presentacion_pregunta
    ADD CONSTRAINT pp_respuesta_fk FOREIGN KEY ( id_respuesta )
        REFERENCES respuesta ( id_respuesta );

ALTER TABLE pregunta
    ADD CONSTRAINT pregunta_docente_fk FOREIGN KEY ( id_docente )
        REFERENCES docente ( id_docente );

ALTER TABLE pregunta_examen
    ADD CONSTRAINT pregunta_examen_examen_fk FOREIGN KEY ( id_examen )
        REFERENCES examen ( id_examen );

ALTER TABLE pregunta_examen
    ADD CONSTRAINT pregunta_examen_pregunta_fk FOREIGN KEY ( id_pregunta )
        REFERENCES pregunta ( id_pregunta );

ALTER TABLE pregunta
    ADD CONSTRAINT pregunta_tema_fk FOREIGN KEY ( id_tema )
        REFERENCES tema ( id_tema );

ALTER TABLE presentacion_examen
    ADD CONSTRAINT presentacion_examen_alumno_fk FOREIGN KEY ( id_alumno )
        REFERENCES alumno ( id_alumno );

ALTER TABLE presentacion_examen
    ADD CONSTRAINT presentacion_examen_examen_fk FOREIGN KEY ( id_examen )
        REFERENCES examen ( id_examen );

ALTER TABLE respuesta
    ADD CONSTRAINT respuesta_pregunta_fk FOREIGN KEY ( id_pregunta )
        REFERENCES pregunta ( id_pregunta );

ALTER TABLE unidad
    ADD CONSTRAINT unidad_curso_fk FOREIGN KEY ( id_curso )
        REFERENCES curso ( id_curso );

CREATE SEQUENCE alumno_id_alumno_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER alumno_id_alumno_trg BEFORE
    INSERT ON alumno
    FOR EACH ROW
    WHEN ( new.id_alumno IS NULL )
BEGIN
    :new.id_alumno := alumno_id_alumno_seq.nextval;
END;
/

CREATE SEQUENCE bloque_horiario_id_bloque_hora START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER bloque_horiario_id_bloque_hora BEFORE
    INSERT ON bloque_horiario
    FOR EACH ROW
    WHEN ( new.id_bloque_horario IS NULL )
BEGIN
    :new.id_bloque_horario := bloque_horiario_id_bloque_hora.nextval;
END;
/

CREATE SEQUENCE curso_id_curso_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER curso_id_curso_trg BEFORE
    INSERT ON curso
    FOR EACH ROW
    WHEN ( new.id_curso IS NULL )
BEGIN
    :new.id_curso := curso_id_curso_seq.nextval;
END;
/

CREATE SEQUENCE docente_id_docente_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER docente_id_docente_trg BEFORE
    INSERT ON docente
    FOR EACH ROW
    WHEN ( new.id_docente IS NULL )
BEGIN
    :new.id_docente := docente_id_docente_seq.nextval;
END;
/

CREATE SEQUENCE examen_id_examen_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER examen_id_examen_trg BEFORE
    INSERT ON examen
    FOR EACH ROW
    WHEN ( new.id_examen IS NULL )
BEGIN
    :new.id_examen := examen_id_examen_seq.nextval;
END;
/

CREATE SEQUENCE grupo_id_grupo_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER grupo_id_grupo_trg BEFORE
    INSERT ON grupo
    FOR EACH ROW
    WHEN ( new.id_grupo IS NULL )
BEGIN
    :new.id_grupo := grupo_id_grupo_seq.nextval;
END;
/

CREATE SEQUENCE pregunta_id_pregunta_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER pregunta_id_pregunta_trg BEFORE
    INSERT ON pregunta
    FOR EACH ROW
    WHEN ( new.id_pregunta IS NULL )
BEGIN
    :new.id_pregunta := pregunta_id_pregunta_seq.nextval;
END;
/

CREATE SEQUENCE presentacion_examen_id_present START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER presentacion_examen_id_present BEFORE
    INSERT ON presentacion_examen
    FOR EACH ROW
    WHEN ( new.id_presentacion_examen IS NULL )
BEGIN
    :new.id_presentacion_examen := presentacion_examen_id_present.nextval;
END;
/

CREATE SEQUENCE presentacion_pregunta_id_prese START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER presentacion_pregunta_id_prese BEFORE
    INSERT ON presentacion_pregunta
    FOR EACH ROW
    WHEN ( new.id_presentacion_pregunta IS NULL )
BEGIN
    :new.id_presentacion_pregunta := presentacion_pregunta_id_prese.nextval;
END;
/

CREATE SEQUENCE respuesta_id_respuesta_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER respuesta_id_respuesta_trg BEFORE
    INSERT ON respuesta
    FOR EACH ROW
    WHEN ( new.id_respuesta IS NULL )
BEGIN
    :new.id_respuesta := respuesta_id_respuesta_seq.nextval;
END;
/

CREATE SEQUENCE tema_id_tema_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tema_id_tema_trg BEFORE
    INSERT ON tema
    FOR EACH ROW
    WHEN ( new.id_tema IS NULL )
BEGIN
    :new.id_tema := tema_id_tema_seq.nextval;
END;
/

CREATE SEQUENCE unidad_id_unidad_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER unidad_id_unidad_trg BEFORE
    INSERT ON unidad
    FOR EACH ROW
    WHEN ( new.id_unidad IS NULL )
BEGIN
    :new.id_unidad := unidad_id_unidad_seq.nextval;
END;
/