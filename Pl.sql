CREATE OR REPLACE PROCEDURE login (p_id IN VARCHAR2, rol IN VARCHAR2, res OUT CHAR) AS
cursor c_alumno is select * from alumno a where a.ID_ALUMNO = p_id;
cursor c_docente is select * from docente d where d.ID_DOCENTE = p_id;
v_alumno alumno%ROWTYPE;
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
