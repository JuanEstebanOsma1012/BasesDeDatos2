-- ESTO ES LO QUE DEBERIA FUNCIONAR PERO NO TENGO ESPACIO EN EL DISCO =)

-- Tablespace para docentes: asignado con espacio suficiente para el crecimiento de datos relacionados con docentes.
CREATE TABLESPACE docente
DATAFILE 'datafiles_prueba/docente.dat' 
SIZE 3231K
AUTOEXTEND ON 
NEXT 258K -- Incrementos para el autoextend que permiten un crecimiento progresivo sin intervención manual.
MAXSIZE 8381K; -- Sin límite para permitir la expansión conforme a las necesidades futuras.

-- Tablespace para estudiantes: similar al de docentes, pero enfocado en datos de estudiantes.
CREATE TABLESPACE alumno
DATAFILE 'datafiles_prueba/alumno.dat'
SIZE 63899K
AUTOEXTEND ON 
NEXT 5092K -- Incrementos adecuados para manejar el aumento esperado de registros de estudiantes.
MAXSIZE 165736K;

-- Tablespace para índices de docentes: menor que los de datos ya que los índices generalmente ocupan menos espacio.
CREATE TABLESPACE docente_idx
DATAFILE 'datafiles_prueba/docente_idx.dat'
SIZE 6462K -- Capacidad inicial basada en la estructura y cantidad de índices de docentes.
AUTOEXTEND ON 
NEXT 515K -- Incrementos para gestionar la adición de nuevos índices sin problemas.
MAXSIZE 16762K;

-- Tablespace para índices de estudiantes: configurado para soportar índices de las tablas de estudiantes.
CREATE TABLESPACE alumno_idx
DATAFILE 'datafiles_prueba/alumno_idx.dat'
SIZE 127797K -- Tamaño proyectado para índices, teniendo en cuenta el número y tamaño de los índices existentes.
AUTOEXTEND ON 
NEXT 10184K -- Ajustes para el autoextend que facilitan la administración de espacio de índices.
MAXSIZE 331473K;

-- El espacio del contenedor y el volumen que se está compartiendo, si pongo el datafile fuera del volumen compartido me tiro todo =)
