CREATE OR REPLACE PROCEDURE login(p_id IN VARCHAR2, rol IN VARCHAR2, res OUT CHAR) AS
    cursor c_alumno is select *
                       from alumno a
                       where a.ID_ALUMNO = p_id;
    cursor c_docente is select *
                        from docente d
                        where d.ID_DOCENTE = p_id;
    v_alumno  alumno%ROWTYPE;
    v_docente docente%ROWTYPE;
BEGIN
    if rol = 'docente' then

        open c_docente;
        fetch c_docente into v_docente;
        if c_docente%FOUND then
            res := '1';
            dbms_output.put_line('docente encontrado');
        else
            res := '0';
        end if;
        close c_docente;

    else

        open c_alumno;
        fetch c_alumno into v_alumno;
        if c_alumno%FOUND then
            res := '1';
            dbms_output.put_line('alumno encontrado');
        else
            res := '0';
        end if;
        close c_alumno;
    end if;
end;

set serveroutput on;
declare
    res char;
begin
    login('1000', 'docente', res);
    dbms_output.put_line(res);
end;


------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------



-- Procedimiento que retorna los grupos de un usuario dado su id y rol.
-- Retorna un JSON con los grupos del usuario, especficando el id del grupo, el nombre del grupo y el nombre del curso.
create or replace procedure get_grupos_por_usuario(p_id_usuario in varchar2, rol in varchar2, res out clob) as
BEGIN

    if rol = 'docente' then
        -- Retornar los grupos de un docente.
        SELECT JSON_ARRAYAGG(
                       JSON_OBJECT(
                               'id_grupo' VALUE id_grupo,
                               'nombre_grupo' VALUE nombre_grupo,
                               'nombre_curso' VALUE nombre_curso
                               FORMAT JSON
                       )
               )
        INTO res
        from (select g.ID_GRUPO id_grupo,
                     g.NOMBRE   nombre_grupo,
                     c.NOMBRE   nombre_curso
              from docente d
                       join grupo g on (d.ID_DOCENTE = p_id_usuario AND d.id_docente = g.id_docente)
                       join curso c on (c.id_curso = g.id_curso));

    else
        -- Retornar los grupos de un alumno.
        SELECT JSON_ARRAYAGG(
                   JSON_OBJECT(
                           'id_grupo' VALUE id_grupo,
                           'nombre_grupo' VALUE nombre_grupo,
                           'nombre_curso' VALUE nombre_curso
                           FORMAT JSON
                   )
           )
    INTO res
    from (select ag.ID_GRUPO id_grupo, g.NOMBRE nombre_grupo, c.NOMBRE nombre_curso
          from alumno_grupo ag
                   join grupo g on (ag.id_grupo = g.id_grupo)
                   join curso c on (c.id_curso = g.id_curso)
          where ag.id_alumno = p_id_usuario);
    end if;
end;

-----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Obtener el nombre dado el id del usuario y el rol.
create or replace procedure get_nombre_usuario(p_id_usuario in varchar2, rol in varchar2, res out varchar2) as
BEGIN
    if rol = 'docente' then
        SELECT d.NOMBRE || ' ' || d.APELLIDO
        INTO res
        from docente d
        where d.ID_DOCENTE = p_id_usuario;
    else
        SELECT a.NOMBRE || ' ' || a.APELLIDO
        INTO res
        from alumno a
        where a.ID_ALUMNO = p_id_usuario;
    end if;
end;

----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------

---

-- obtenerExamenesPresentadosAlumnoGrupo()
-- @descripción: Se encarga de obtener la presentacion_examen de un alumno específico en un grupo específico
-- @return: retorna un cursor con todos las presentación_examen que cumplan
-- DTO-in: id-alumno, id_grupo
-- DTO-out: Lista de - > (Presentacion_examen)


CREATE OR REPLACE PROCEDURE tomar_examenes_alumno_grupo (
    v_id_alumno       IN alumno.id_alumno%TYPE,
    v_id_grupo      IN grupo.id_grupo%TYPE,
    p_examenes OUT SYS_REFCURSOR
) 
IS
BEGIN
    OPEN p_examenes FOR
    SELECT pe.*
    FROM presentacion_examen pe
    JOIN examen e ON pe.id_examen = e.id_examen
    JOIN Grupo g ON e.id_grupo = g.id_grupo
    WHERE pe.id_alumno = v_id_alumno
    AND g.id_grupo = v_id_grupo;
END tomar_examenes_alumno_grupo;
/


-- El siguiente es el procedimiento que consume el backend. Este procedimiento a su vez consume el procedimiento anterior.
-- Este procedimiento devuelve unicamente el nombre del examen que presentó el alumno que viene por parametro, así como la nota de la
-- presentación del examen y el id de la presentación examen.

create or replace procedure  get_presentacion_examen_alumno_grupo(p_id_alumno in number, p_id_grupo in number, res out clob) as
    v_examenes SYS_REFCURSOR;
    v_json     CLOB;
BEGIN

    SELECT JSON_ARRAYAGG(
               JSON_OBJECT(
                       'id_presentacion_examen' VALUE id_presentacion_examen,
                       'nombre_examen' VALUE nombre_examen,
                       'nota' VALUE TO_CHAR(CALIFICACION)
                       FORMAT JSON
               )
           )
    INTO v_json
    FROM (SELECT pe.id_presentacion_examen id_presentacion_examen,
                 e.nombre nombre_examen,
                 pe.CALIFICACION calificacion
          FROM presentacion_examen pe
                   JOIN examen e ON pe.id_examen = e.id_examen
                   JOIN Grupo g ON e.id_grupo = g.id_grupo
          WHERE pe.id_alumno = p_id_alumno
            AND g.id_grupo = p_id_grupo);
    res := v_json;

END get_presentacion_examen_alumno_grupo;

