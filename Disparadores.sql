-- este trigger verifica que el examen no pueda ser publicado si no
-- hay suficientes preguntas en el banco para suplir la cantidad de preguntas propias

-- TODO: falta posible validacion del estado del examen
CREATE OR REPLACE TRIGGER agregar_preguntas_examen
AFTER UPDATE OF estado ON examen
FOR EACH ROW
WHEN (NEW.estado = 'PUBLICADO')
DECLARE

    v_preguntas_disponibles INTEGER;
    v_pregunta_seleccionada INTEGER;
    v_id_pregunta INTEGER;
    v_cantidad_preguntas INTEGER;

BEGIN

    SELECT COUNT(*) INTO v_cantidad_preguntas FROM pregunta_examen WHERE id_examen = :NEW.id_examen;

    SELECT COUNT(*) INTO v_preguntas_disponibles FROM (
        SELECT id_pregunta FROM pregunta
        WHERE id_tema = :NEW.id_tema AND es_publica = 'Y'
        MINUS
        SELECT id_pregunta FROM pregunta
        WHERE id_tema = :NEW.id_tema AND es_publica = 'Y' AND id_pregunta IN (
            SELECT id_pregunta
            FROM pregunta_examen
            WHERE id_examen = :NEW.id_examen
        )
    );

    IF v_cantidad_preguntas + v_preguntas_disponibles < :NEW.numero_preguntas THEN
        RAISE_APPLICATION_ERROR(-20002, 'no hay suficientes preguntas para llenar el examen');
    END IF;

    IF v_cantidad_preguntas < :NEW.numero_preguntas THEN

        FOR i IN 1..:NEW.numero_preguntas LOOP

            v_pregunta_seleccionada := DBMS_RANDOM.VALUE(1, v_preguntas_disponibles);
            
            SELECT id_pregunta INTO v_id_pregunta FROM (
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
            ) WHERE ROWNUM = v_pregunta_seleccionada;

            IF (SELECT id_pregunta_compuesta FROM PREGUNTA WHERE id_pregunta = v_id_pregunta) = NULL THEN
                INSERT INTO pregunta_examen (id_examen, id_pregunta, tiene_tiempo_maximo) VALUES (:NEW.id_examen, id_pregunta, 'N');
                v_preguntas_disponibles := v_preguntas_disponibles - 1;
            ELSE
                i := i - 1;
            END IF;
        END LOOP;
    END IF;
END;

-- este trigger establece que la hora y fecha de presentacion del examen es la hora en la que se dispara el trigger
CREATE OR REPLACE TRIGGER establecer_hora_presentacion
BEFORE INSERT ON presentacion_examen
FOR EACH ROW
DECLARE
BEGIN
    :NEW.FECHA_HORA_PRESENTACION := SYSDATE;
END;

-- este trigger establece las preguntas que se presentaran en la presentacion del examen del alumno de forma aleatoria
CREATE OR REPLACE TRIGGER establecer_preguntas_presentacion
AFTER INSERT ON presentacion_examen
FOR EACH ROW
DECLARE
    v_preguntas_disponibles INTEGER;
    v_pregunta_seleccionada INTEGER;
    v_cantidad_preguntas INTEGER;
    v_id_pregunta PREGUNTA.ID_PREGUNTA%TYPE;
    --
BEGIN

    SELECT numero_preguntas INTO v_preguntas_disponibles FROM examen WHERE id_examen = :NEW.id_examen;
    v_cantidad_preguntas := v_preguntas_disponibles;

    FOR i IN 1..v_cantidad_preguntas LOOP

        v_pregunta_seleccionada := DBMS_RANDOM.VALUE(1, v_preguntas_disponibles);
        
        SELECT id_pregunta INTO v_id_pregunta FROM (
            SELECT * FROM (
                SELECT id_pregunta
                FROM pregunta_examen
                WHERE id_examen = :NEW.id_examen
                MINUS
                SELECT id_pregunta
                FROM presentacion_pregunta
                WHERE id_presentacion_examen = :NEW.id_presentacion_examen
            ) ORDER BY DBMS_RANDOM.RANDOM
        ) WHERE ROWNUM = v_pregunta_seleccionada;

        INSERT INTO presentacion_pregunta (respuesta_correcta, id_presentacion_examen, id_pregunta) VALUES ('N', :NEW.id_presentacion_examen, v_id_pregunta);
        v_preguntas_disponibles := v_preguntas_disponibles - 1;

    END LOOP;
END;

-- este trigger verifica que el tema de la pregunta que se va a adicionar al examen sea exactamente el mismo que el tema del examen
CREATE OR REPLACE TRIGGER verificar_pregunta_examen
BEFORE INSERT ON pregunta_examen
FOR EACH ROW
DECLARE
    v_id_tema_examen pregunta.id_tema%TYPE;
    v_id_tema_pregunta pregunta.id_tema%TYPE;
BEGIN
    SELECT id_tema INTO v_id_tema_examen FROM examen WHERE id_examen = :NEW.id_examen;
    SELECT id_tema INTO v_id_tema_pregunta FROM pregunta WHERE id_pregunta = :NEW.id_pregunta;
    IF v_id_tema_examen != v_id_tema_pregunta THEN
        RAISE_APPLICATION_ERROR(-20001, 'la pregunta no pertenece al tema del examen');
    END IF;
END;

-- este trigger verifica que la pregunta que se va a adicionar al examen no sea una pregunta compuesta
CREATE OR REPLACE TRIGGER verificar_pregunta_compuesta
BEFORE INSERT ON pregunta_examen
FOR EACH ROW
DECLARE
    v_id_pregunta_compuesta pregunta.id_pregunta_compuesta%TYPE;
BEGIN
    SELECT id_pregunta_compuesta INTO v_id_pregunta_compuesta FROM pregunta WHERE id_pregunta = :NEW.id_pregunta;
    IF v_id_pregunta_compuesta != NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'la pregunta no puede ser compuesta');
    END IF;
END;

-- este trigger verifica que un examen que ya está en estado publicado no pueda ser modificado o eliminado si algún estudiante ya ha presentado dicho examen
-- no se toma el estado del examen en cuenta ya que se asume que un examen que ha sido presentado está en estado publicado
CREATE OR REPLACE TRIGGER verificar_examen_presentado
BEFORE UPDATE OR DELETE ON examen
FOR EACH ROW
DECLARE
    v_presentaciones INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_presentaciones FROM presentacion_examen WHERE id_examen = :OLD.id_examen;
    IF v_presentaciones > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'el examen ya ha sido presentado por un estudiante');
    END IF;
END;

-- este trigger verifica
