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
