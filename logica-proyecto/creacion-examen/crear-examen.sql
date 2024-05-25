-- Disparador que se ejecuta al crear un examen.

-- Al insertar una nueva pregunta:

CREATE OR REPLACE TRIGGER agregar_pregunta_opcion_multiple
    before insert
    on RESPUESTA
    for each row
    when (:new.tipo_pregunta = 'OPCION_MULTIPLE_MULTIPLE_RESPUESTA')
begin

end;