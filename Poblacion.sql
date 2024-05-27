--CURSOS
INSERT INTO curso (id_curso, nombre, descripcion)
SELECT
    REGEXP_SUBSTR(column_value, '[^,]+', 1, 1) AS id_curso,
    REGEXP_SUBSTR(column_value, '[^,]+', 1, 2) AS nombre,
    REGEXP_SUBSTR(column_value, '[^,]+', 1, 3) AS descripcion
FROM
    TABLE(sys.odcivarchar2list(
            '100, Matemáticas, Curso básico de matemáticas.',
            '101, Física, Principios fundamentales de la física.',
            '102, Química, Explorando los elementos y sus interacciones.',
            '103, Biología, El estudio de la vida.',
            '104, Historia, Un viaje a través del tiempo.',
            '105, Literatura, Explorando la belleza de la palabra escrita.',
            '106, Inglés, Dominando la lengua inglesa.',
            '107, Español, Profundizando en el idioma español.',
            '108, Arte, Despertando la creatividad a través del arte.',
            '109, Música, Apreciando la armonia y el ritmo.',
            '110, Geografía, Un vistazo al mundo que nos rodea.',
            '111, Economia, Entendiendo el flujo del dinero y los recursos.',
            '112, Psicología, Explorando la mente humana.',
            '113, Sociología, Estudio de la sociedad y sus estructuras.',
            '114, Filosofía, Cuestionando la existencia y la realidad.',
            '115, Informática, Dominando el mundo digital.',
            '116, Ingeniería, Aplicando la ciencia para resolver problemas.',
            '117, Medicina, El arte de curar y cuidar.',
            '118, Derecho, Estudiando las leyes y la justicia.',
            '119, Arquitectura, Diseñando espacios para la vida.',
            '120, Diseño, Creando soluciones visuales innovadoras.',
            '121, Comunicación, El poder de las palabras e imágenes.',
            '122, Educación, Formando las mentes del futuro.',
            '123, Administración, Gestionando recursos para el éxito.',
            '124, curso_random, ¡ lo que se enseña aquí es sorpresa !.'
        ));


COMMIT;

-- Datos de la unidad
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (22, 'Revoluciones del Mundo', 'Introducción a las principales revoluciones del mundo.', 104);
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (23, 'Grandes Imperios', 'Introducción a la historia de los grandes imperios.', 104);
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (24, 'Biología: Introducción', 'Introducción a la biología celular.', 103);
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (25, 'Evolución: Introducción', 'Introducción a las teorías y principios de la evolución.', 103);
-- Matemáticas (id_curso = 100)
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (1, 'Matemáticas: Introducción', 'Introducción al curso básico de matemáticas.', 100);
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (2, 'Matemáticas: Álgebra', 'Estudio de los fundamentos del álgebra.', 100);
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (3, 'Matemáticas: Geometría', 'Exploración de las formas y espacios geométricos.', 100);

-- Física (id_curso = 101)
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (4, 'Física: Introducción', 'Principios fundamentales de la física.', 101);
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (5, 'Física: Mecánica', 'Estudio de la mecánica clásica.', 101);
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (6, 'Física: Termodinámica', 'Exploración de los principios de la termodinámica.', 101);

-- Química (id_curso = 102)
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (7, 'Química: Introducción', 'Explorando los elementos y sus interacciones.', 102);
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (8, 'Química: Química Orgánica', 'Estudio de los compuestos orgánicos y sus reacciones.', 102);
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (9, 'Química: Química Inorgánica', 'Exploración de los compuestos inorgánicos y sus propiedades.', 102);

-- Biología (id_curso = 103)
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (10, 'Biología: Introducción', 'Introducción al estudio de la vida.', 103);
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (11, 'Biología: Genética', 'Exploración de los principios de la genética.', 103);
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (12, 'Biología: Ecología', 'Estudio de las interacciones entre organismos y su entorno.', 103);

-- Historia (id_curso = 104)
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (13, 'Historia: Introducción', 'Un viaje a través del tiempo.', 104);
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (14, 'Historia: Edad Antigua', 'Exploración de las civilizaciones antiguas.', 104);
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (15, 'Historia: Edad Media', 'Estudio de los eventos y culturas de la Edad Media.', 104);

-- Literatura (id_curso = 105)
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (16, 'Literatura: Introducción', 'Explorando la belleza de la palabra escrita.', 105);
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (17, 'Literatura: Literatura Clásica', 'Estudio de las grandes obras de la literatura clásica.', 105);
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (18, 'Literatura Contemporánea', 'Exploración de las tendencias y obras contemporáneas.', 105);

-- Inglés (id_curso = 106)
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (19, 'Inglés: Introducción', 'Dominando la lengua inglesa.', 106);
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (20, 'Inglés: Gramática', 'Estudio de la gramática inglesa.', 106);
INSERT INTO unidad (id_unidad, titulo, descripcion, id_curso) VALUES (21, 'RANDOM', 'RANDOM.', 124);


-- Datos de tema
-- Relacionados con Revoluciones del Mundo (id_unidad = 22)
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (1, 'Revolución Industrial', 'Impacto socioeconómico y tecnológico del siglo XIX.',22);
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (11, 'Imperio Romano', 'Historia, gobierno y cultura del antiguo imperio romano.', 23);

-- Relacionados con Grandes Imperios (id_unidad = 23)
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (2, 'Ecuaciones Diferenciales', 'Métodos para resolver ecuaciones que contienen derivadas.', 22);
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (13, 'Arte del Renacimiento', 'Obras artísticas y características del Renacimiento.', 23);
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (23, 'Neurociencia Cognitiva', 'Estudio de los procesos mentales y su base neural.', 23);

-- Relacionados con Biología Celular: Introducción (id_unidad = 24)
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (26, 'Biología Celular', 'Estudio de la estructura celular.', 24);
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (14, 'Genética Molecular', 'Estudio de la estructura y función de los genes.', 24);

-- Relacionados con Evolución: Introducción (id_unidad = 25)
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (4, 'Teoría de la Evolución', 'Principios y mecanismos de la evolución biológica.', 25);
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (9, 'Ecología y Conservación', 'Interacciones entre los organismos y su entorno.', 25);


-- Datos de tema con id_unidad = 21
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (3, 'Filosofía Existencialista', 'Exploración de la libertad', 21);
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (5, 'Literatura del Siglo de Oro', 'Obras literarias destacadas del Renacimiento', 21);
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (6, 'Geometría Fractal', 'Estudio de figuras geométricas ', 21);
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (7, 'Magnetismo y Electricidad', 'Conceptos básicos.', 21);
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (8, 'Psicología del Desarrollo', 'Estudio de los cambios psicológicos.', 21);
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (10, 'Teoría de Juegos', 'Modelos matemáticos de interacción.', 21);
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (12, 'Cálculo Integral', 'Técnicas para calcular áreas y volúmenes bajo curvas.', 21);
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (15, 'Literatura Contemporánea', 'Movimientos literarios.', 21);
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (16, 'Teoría del Caos', 'Sistemas dinámicos no lineales.', 21);
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (17, 'Química Orgánica', 'Estudio de los compuestos orgánicos y sus reacciones.', 21);
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (18, 'Psicología Social', 'Interacciones contextos sociales.', 21);
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (19, 'Medicina Tradicional China', 'Principios.', 21);
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (20, 'Robótica Avanzada', 'Diseño y programación de robots autónomos', 21);
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (21, 'Teoría de la Relatividad', 'Conceptos', 21);
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (22, 'Arquitectura Sostenible', 'Diseño', 21);
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (24, 'Derechos Humanos', 'Principios fundamentales', 21);
INSERT INTO tema (id_tema, titulo, descripcion, unidad_id_unidad) VALUES (25, 'Economía Global', 'Interacciones económicas entre naciones', 21);




-- Insertar datos en la tabla 'docente' desde una colección.
INSERT INTO docente (id_docente, nombre, apellido, identificacion)
SELECT
    REGEXP_SUBSTR(column_value, '[^,]+', 1, 1) AS id_docente,
    REGEXP_SUBSTR(column_value, '[^,]+', 1, 2) AS nombre,
    REGEXP_SUBSTR(column_value, '[^,]+', 1, 3) AS apellido,
    REGEXP_SUBSTR(column_value, '[^,]+', 1, 1) AS identificacion -- Usando el id_docente como identificacion
FROM
    TABLE(sys.odcivarchar2list(
            '1000, Alice, Johnson',
            '1001, Bob, Smith',
            '1002, Charlie, Williams',
            '1003, David, Brown',
            '1004, Emily, Davis',
            '1005, Frank, Miller',
            '1006, Grace, Wilson',
            '1007, Henry, Moore',
            '1008, Isabella, Taylor',
            '1009, Jack, Anderson',
            '1010, Katherine, Thomas',
            '1011, Liam, Jackson',
            '1012, Mia, White',
            '1013, Noah, Harris',
            '1014, Olivia, Martin',
            '1015, Peter, Thompson',
            '1016, Queen, Garcia',
            '1017, Robert, Martinez',
            '1018, Sophia, Robinson',
            '1019, Thomas, Clark',
            '1020, Ursula, Lewis',
            '1021, Vincent, Lee',
            '1022, William, Walker',
            '1023, Xenia, Hall',
            '1024, Yolanda, Allen',
            '1025, Zachary, Young',
            '1026, Abigail, King',
            '1027, Benjamin, Wright',
            '1028, Charlotte, Scott',
            '1029, Daniel, Green'
        ));

COMMIT;



-- Insertar datos de ejemplo en la tabla pregunta
-- Pregunta 1
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (1, '¿La selección natural es un mecanismo importante en la evolución?', 'S', 'falso_verdadero', NULL, 4, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 2
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (2, '¿Cuál es el organelo responsable de la síntesis de proteínas en la célula?', 'S', 'falso_verdadero', NULL, 26, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 3
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (3, '¿Julio César fue el primer emperador romano?', 'S', 'falso_verdadero', NULL, 11, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 4
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (4, '¿Las máquinas de vapor fueron un avance importante durante la revolución industrial?', 'S', 'falso_verdadero', NULL, 1, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 5
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (5, '¿Cuál es la teoría que propone que los organismos evolucionan a lo largo del tiempo a través de la selección natural?', 'S', 'multiple_unica_respuesta', NULL, 4, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 6
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (6, '¿Qué estructura celular contiene la información genética en forma de ADN?', 'S', 'multiple_unica_respuesta', NULL, 26, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 7
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (7, '¿Cuál era la capital del Imperio Romano durante su período de máximo esplendor?', 'S', 'multiple_unica_respuesta', NULL, 11, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 8
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (8, '¿Qué innovación tecnológica impulsó el crecimiento de la industria textil durante la Revolución Industrial?', 'S', 'multiple_unica_respuesta', NULL, 1, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 9
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (9, 'Relacione las siguientes palabras con su función celular correspondiente: "Ribosomas" y "Centriolos"', 'S', 'emparejar_conceptos', NULL, 26, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 10
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (10, '¿Cuál de los siguientes eventos históricos marcó el inicio de la Revolución Industrial?', 'S', 'multiple_unica_respuesta', NULL, 1, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 11
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (11, '¿La mitocondria es el "centro de control" de la célula?', 'S', 'falso_verdadero', NULL, 26, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 12
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (12, '¿Qué caracterizó al período de la Pax Romana?', 'S', 'multiple_unica_respuesta', NULL, 11, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 13
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (13, '¿Qué impacto tuvo la invención del telar mecánico en la industria textil durante la Revolución Industrial?', 'S', 'falso_verdadero', NULL, 1, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 14
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (14, '¿Cuál es la función principal de los lisosomas en la célula?', 'S', 'multiple_unica_respuesta', NULL, 26, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 15
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (15, '¿Qué emperador romano fue conocido por su política de "Pan y Circo" para mantener la estabilidad social?', 'S', 'multiple_unica_respuesta', NULL, 11, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 16
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (16, '¿Qué factor contribuyó al desarrollo de la máquina de vapor durante la Revolución Industrial?', 'S', 'multiple_unica_respuesta', NULL, 1, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 17
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (17, 'Relacione los siguientes conceptos con su significado adecuado: "Mitocondria" y "Cloroplasto"', 'S', 'emparejar_conceptos', NULL, 26, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 18
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (18, '¿Qué factor político influyó en el declive del Imperio Romano?', 'S', 'multiple_unica_respuesta', NULL, 11, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 19
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (19, '¿Cuál de los siguientes recursos naturales fue crucial para la expansión de la industria durante la Revolución Industrial?', 'S', 'multiple_unica_respuesta', NULL, 1, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 20
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (20, '¿Qué función desempeñan los ribosomas en la síntesis de proteínas?', 'S', 'multiple_unica_respuesta', NULL, 26, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 21
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (21, '¿Cuál fue el impacto de la teoría de la selección natural en el pensamiento científico del siglo XIX?', 'S', 'multiple_unica_respuesta', NULL, 4, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 22
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (22, '¿Qué estructuras celulares están involucradas en la fotosíntesis?', 'S', 'multiple_unica_respuesta', NULL, 26, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 23
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (23, '¿Cuál fue el impacto de las guerras púnicas en la expansión territorial de Roma?', 'S', 'multiple_unica_respuesta', NULL, 11, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 24
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (24, '¿Qué efecto tuvo la invención de la locomotora de vapor en el transporte durante la Revolución Industrial?', 'S', 'multiple_unica_respuesta', NULL, 1, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 25
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (25, '¿Cuál es la función principal de los cloroplastos en la célula vegetal?', 'S', 'multiple_unica_respuesta', NULL, 26, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

--AÑADO LAS PREGUNTAS QUE VAN A TENER SUBPREGUNTAS

-- Pregunta 26 (Padre)
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (26, '¿Qué afirmaciones son verdaderas acerca de la evolución?', 'S', 'multiple_multiple_respuesta', NULL, 4, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Subpregunta 1 (Hija)
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (27, 'La selección natural es un mecanismo importante en la evolución', 'S', 'falso_verdadero', 26, 4, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Subpregunta 2 (Hija)
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (28, 'Los organismos evolucionan de acuerdo con los cambios ambientales', 'S', 'falso_verdadero', 26, 4, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta 27 (Padre)
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (29, '¿Cuál es el proceso completo de la fotosíntesis?', 'S', 'ordenar_conceptos', NULL,26, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Subpregunta 1 (Hija)
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (30, 'Captación de luz solar', 'S', 'ordenar_conceptos', 29, 26, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Subpregunta 2 (Hija)
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (31, 'Producción de glucosa', 'S', 'ordenar_conceptos', 29, 26, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

-- Pregunta adicional
INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (32, '¿Cuáles son organelos celulares?', 'S', 'multiple_multiple_respuesta', NULL, 26, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');




-- RESPUESTAS

-- Respuestas para las preguntas de tipo falso_verdadero
-- Respuestas para la pregunta 1


INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (1, 'Verdadero', 't', 1);

-- Respuestas para la pregunta 2
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (2, 'Verdadero', 't', 2);

-- Respuestas para la pregunta 3
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (3, 'Falso', 'f', 3);

-- Respuestas para la pregunta 4
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (4, 'Verdadero', 't', 4);

-- Respuestas para la pregunta 11
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (5, 'Verdadero', 't', 11);

-- Respuestas para la pregunta 13
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (6, 'Falso', 'f', 13);

--- RESPUESTAS PARA PREGUNTAS DE SELECCION MULTIPLE DE UNICA RESPUES
-- Respuestas para pregunta 5
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (54, 'a) Verdadero', 't', 5);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (55, 'b) Falso', 'f', 5);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (7, 'c) No sé', 'f', 5);

-- Respuestas para la pregunta 6
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (8, 'a) Núcleo', 'f', 6);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (9, 'b) Mitocondria', 't', 6);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (10, 'c) Lisosoma', 'f', 6);

-- Respuestas para la pregunta 7
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (11, 'a) Roma', 't', 7);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (12, 'b) Atenas', 'f', 7);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (13, 'c) Cartago', 'f', 7);

-- Respuestas para la pregunta 8
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (14, 'a) Telar mecánico', 't', 8);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (15, 'b) Rueda', 'f', 8);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (16, 'c) Pluma estilográfica', 'f', 8);

-- Respuestas para la pregunta 10
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (17, 'a) Invención de la máquina de vapor', 't', 10);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (18, 'b) Descubrimiento de la penicilina', 'f', 10);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (19, 'c) Guerra de los Cien Años', 'f', 10);

-- Respuestas para la pregunta 12
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (20, 'a) Pax Romana', 't', 12);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (21, 'b) Edad Media', 'f', 12);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (22, 'c) Era de los descubrimientos', 'f', 12);

-- Respuestas para la pregunta 14
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (23, 'a) Digerir alimentos', 'f', 14);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (24, 'b) Síntesis de proteínas', 't', 14);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (25, 'c) Almacenamiento de agua', 'f', 14);

-- Respuestas para la pregunta 15
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (26, 'a) Julio César', 't', 15);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (27, 'b) Augusto', 'f', 15);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (28, 'c) Nerón', 'f', 15);

-- Respuestas para la pregunta 16
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (29, 'a) Carbón', 't', 16);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (30, 'b) Hierro', 'f', 16);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (31, 'c) Petróleo', 'f', 16);

-- Respuestas para la pregunta 18
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (32, 'a) Corrupción interna', 't', 18);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (33, 'b) Invasiones bárbaras', 'f', 18);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (34, 'c) Caida de Constantinopla', 'f', 18);

-- Respuestas para la pregunta 19
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (35, 'a) Carbón', 't', 19);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (36, 'b) Diamante', 'f', 19);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (37, 'c) Plata', 'f', 19);

-- Respuestas para la pregunta 20
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (38, 'a) Síntesis de proteínas', 't', 20);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (39, 'b) Almacenamiento de agua', 'f', 20);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (40, 'c) Transporte de lípidos', 'f', 20);

-- Respuestas para la pregunta 21
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (41, 'a) La selección natural es un mecanismo importante', 't', 21);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (42, 'b) Los seres vivos no cambian a lo largo del tiempo', 'f', 21);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (43, 'c) El entorno no influye en la supervivencia de los organismos', 'f', 21);

-- Respuestas para la pregunta 22
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (44, 'a) Clorofila', 't', 22);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (45, 'b) Hemoglobina', 'f', 22);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (46, 'c) Melanina', 'f', 22);

-- Respuestas para la pregunta 23
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (47, 'a) Expansión territorial de Roma', 't', 23);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (48, 'b) Comercio con Grecia', 'f', 23);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (49, 'c) Paz y estabilidad en Italia', 'f', 23);

-- Respuestas para la pregunta 24
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (50, 'a) Mejoró la velocidad y eficiencia del transporte', 't', 24);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (51, 'b) Provocó la paralización del transporte', 'f', 24);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (52, 'c) No tuvo impacto en el transporte', 'f', 24);

-- Respuestas para la pregunta 25
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (53, 'a) Fotosíntesis', 't', 25);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (56, 'b) Respiración celular', 'f', 25);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (57, 'c) División celular', 'f', 25);


-- Respuesta para la pregunta 27
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (58, 'Verdadero', 't', 27);

-- Respuesta para la pregunta 28
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (59, 'Falso', 'f', 28);

-- Respuestas para la pregunta 30
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (60, 'Captación de luz solar, Producción de glucosa', 'f', 30);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (61, 'Producción de glucosa, Captación de luz solar', 'f', 30);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (62, 'Captación de luz solar, Producción de glucosa', 't', 30);

-- Respuestas para la pregunta 31
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (63, 'A,B,C', 't', 31);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (64, 'C,B,A', 'f', 31);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (65, 'B,C,A', 'f', 31);

--Respuestas para las de emparejar conceptos

-- Respuestas para la pregunta 9
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (66, 'ribosomas:centriolos', 't', 9);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (67, 'núcleo:membrana celular', 'f', 9);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (68, 'lisosoma:cloroplasto', 'f', 9);

-- Respuestas para la pregunta 17
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (69, 'mitocondria:cloroplasto', 't', 17);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (70, 'núcleo:membrana celular', 'f', 17);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (71, 'lisosoma:centriolos', 'f', 17);

--Repsuestas para seleccio multiple con multiple repsuesta

-- Respuestas para la pregunta adicional
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (72, 'a) Mitocondria', 't', 32);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (73, 'b) Ribosomas', 't', 32);
INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (74, 'c) papas fritas', 'f', 32);



--LLenar alumnos

-- Insertar datos en la tabla 'alumno' desde una colección.
INSERT INTO alumno (id_alumno, nombre, apellido)
SELECT
    REGEXP_SUBSTR(column_value, '[^,]+', 1, 1) AS id_alumno,
    REGEXP_SUBSTR(column_value, '[^,]+', 1, 2) AS nombre,
    REGEXP_SUBSTR(column_value, '[^,]+', 1, 3) AS apellido
FROM
    TABLE(sys.odcivarchar2list(
            '1000, Sophia, Smith',
            '1001, Jackson, Moore',
            '1002, Emma, Taylor',
            '1003, Aiden, Anderson',
            '1004, Olivia, Thomas',
            '1005, Liam, Jackson',
            '1006, Ava, White',
            '1007, Noah, Harris',
            '1008, Isabella, Martin',
            '1009, Lucas, Thompson',
            '1010, Mia, Garcia',
            '1011, Ethan, Martinez',
            '1012, Abigail, Robinson',
            '1013, James, Clark',
            '1014, Charlotte, Lewis',
            '1015, Logan, Lee',
            '1016, Harper, Walker',
            '1017, Benjamin, Hall',
            '1018, Evelyn, Allen',
            '1019, Elijah, Young',
            '1020, Amelia, King',
            '1021, Matthew, Wright',
            '1022, Luna, Scott',
            '1023, William, Green',
            '1024, Elizabeth, Brown',
            '1025, Michael, Davis',
            '1026, Evelyn, Miller',
            '1027, Daniel, Wilson',
            '1028, Chloe, Moore',
            '1029, Joseph, Taylor'
        ));


-- Insertar datos en la tabla 'grupo' desde una colección.
INSERT INTO grupo (id_grupo, jornada, nombre, periodo, id_docente, id_curso)
SELECT
    REGEXP_SUBSTR(column_value, '[^,]+', 1, 1) AS id_grupo,
    REGEXP_SUBSTR(column_value, '[^,]+', 1, 2) AS jornada,
    REGEXP_SUBSTR(column_value, '[^,]+', 1, 3) AS nombre,
    REGEXP_SUBSTR(column_value, '[^,]+', 1, 4) AS periodo,
    REGEXP_SUBSTR(column_value, '[^,]+', 1, 5) AS id_docente,
    REGEXP_SUBSTR(column_value, '[^,]+', 1, 6) AS id_curso
FROM
    TABLE(sys.odcivarchar2list(
            '200, diurna, Historia A, 2024-1, 1000, 104',
            '201, nocturna, Historia B, 2024-1, 1001, 104',
            '202, diurna, Historia C, 2024-1, 1000, 104',
            '203, nocturna, Historia D, 2024-1, 1001, 104',
            '204, diurna, Historia E, 2024-1, 1000, 104',
            '205, nocturna, Historia F, 2024-1, 1001, 104',
            '206, diurna, Historia G, 2024-1, 1000, 104',
            '207, nocturna, Historia H, 2024-1, 1001, 104',
            '208, diurna, Historia I, 2024-1, 1000, 104',
            '209, nocturna, Historia J, 2024-1, 1001, 104',
            '210, diurna, Historia K, 2024-1, 1000, 104',
            '211, nocturna, Historia L, 2024-1, 1001, 104',
            '212, diurna, Historia M, 2024-1, 1000, 104',
            '213, nocturna, Biología A, 2024-1, 1002, 103',
            '214, diurna, Biología B, 2024-1, 1003, 103',
            '215, nocturna, Biología C, 2024-1, 1002, 103',
            '216, diurna, Biología D, 2024-1, 1003, 103',
            '217, nocturna, Biología E, 2024-1, 1002, 103',
            '218, diurna, Biología F, 2024-1, 1003, 103',
            '219, nocturna, Biología G, 2024-1, 1002, 103',
            '220, diurna, Biología H, 2024-1, 1003, 103',
            '221, nocturna, Biología I, 2024-1, 1002, 103',
            '222, diurna, Biología J, 2024-1, 1003, 103',
            '223, nocturna, Biología K, 2024-1, 1002, 103',
            '224, diurna, Biología L, 2024-1, 1003, 103',
            '225, nocturna, Biología M, 2024-1, 1002, 103'
        ));
COMMIT;

-- Asignar alumnos a los grupos Biología A, Biología B, Historia A e Historia B.






-- Obtener los IDs de los grupos a poblar.
DECLARE
v_biologia_a_id  grupo.id_grupo%TYPE;
    v_biologia_b_id  grupo.id_grupo%TYPE;
    v_historia_a_id  grupo.id_grupo%TYPE;
    v_historia_b_id  grupo.id_grupo%TYPE;
BEGIN
SELECT id_grupo INTO v_biologia_a_id FROM grupo WHERE nombre = ' Biología A';
SELECT id_grupo INTO v_biologia_b_id FROM grupo WHERE nombre = ' Biología B';
SELECT id_grupo INTO v_historia_a_id FROM grupo WHERE nombre = ' Historia A';
SELECT id_grupo INTO v_historia_b_id FROM grupo WHERE nombre = ' Historia B';

-- Insertar alumnos con IDs entre 1000 y 1014 en Biología A e Historia A
INSERT INTO alumno_grupo (id_grupo, id_alumno)
SELECT v_biologia_a_id, id_alumno
FROM alumno
WHERE id_alumno BETWEEN 1000 AND 1014;

INSERT INTO alumno_grupo (id_grupo, id_alumno)
SELECT v_historia_a_id, id_alumno
FROM alumno
WHERE id_alumno BETWEEN 1000 AND 1014;

-- Insertar alumnos con IDs entre 1015 y 1029 en Biología B e Historia B
INSERT INTO alumno_grupo (id_grupo, id_alumno)
SELECT v_biologia_b_id, id_alumno
FROM alumno
WHERE id_alumno BETWEEN 1015 AND 1029;

INSERT INTO alumno_grupo (id_grupo, id_alumno)
SELECT v_historia_b_id, id_alumno
FROM alumno
WHERE id_alumno BETWEEN 1015 AND 1029;

COMMIT;
END;
/

---Creacion de examenes
-- Examen 1
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (1, 90, 3, 20, 'Biología Celular Examen', 70, TO_DATE('2024-05-15 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-15 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 26, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 213, 'activo');

-- Examen 2
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (2, 120, 5, 15, 'Imperio Romano Examen', 65, TO_DATE('2024-05-16 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-16 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 11, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 201, 'activo');

-- Examen 3
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (3, 60, 4, 10, 'Evolución Examen', 75, TO_DATE('2024-05-17 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-17 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 4, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 200, 'activo');

-- Examen 4
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (4, 90, 3, 25, 'Revolución Industrial Examen', 60, TO_DATE('2024-05-18 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-18 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 1, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 201, 'activo');

-- Examen 5
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (5, 75, 3, 20, 'Biología Celular Avanzado Examen', 70, TO_DATE('2024-05-19 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-19 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 26, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 214, 'activo');

-- Examen 6
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (6, 90, 4, 15, 'Evolución y Biología Celular Examen', 65, TO_DATE('2024-05-20 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-20 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 4, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 213, 'activo');

-- Examen 7
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (7, 120, 5, 20, 'biología celular examen', 70, TO_DATE('2024-05-21 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-21 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 26, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 214, 'activo');

-- Examen 8
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (8, 60, 3, 10, 'Imperio Romano Repaso Examen', 75, TO_DATE('2024-05-22 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-22 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 11, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 200, 'activo');

-- Examen 9
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (9, 90, 4, 25, 'celular raras examen', 60, TO_DATE('2024-05-23 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-23 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 26, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 213, 'activo');

-- Examen 10
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (10, 75, 3, 20, 'Revolución Industrial Resumen Examen', 70, TO_DATE('2024-05-24 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-24 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 201, 'activo');

-- Examen 11
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (11, 120, 5, 15, 'Evolución y Biología Celular II Examen', 65, TO_DATE('2024-05-25 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-25 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 4, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 214, 'activo');

-- Examen 12
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (12, 90, 4, 20, 'Imperio Romano y Revolución Industrial Examen', 70, TO_DATE('2024-05-26 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-26 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 1, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 200, 'activo');

-- Examen 13
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (13, 60, 3, 10, 'Biología Celular Repaso Examen', 75, TO_DATE('2024-05-27 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-27 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 26, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 213, 'activo');

-- Examen 14
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (14, 90, 4, 25, 'Evolución y Revolución Industrial Examen', 60, TO_DATE('2024-05-28 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-28 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 4, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 213, 'activo');

-- Examen 15
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (15, 75, 3, 20, 'Revolución Industrial Avanzado Examen', 70, TO_DATE('2024-05-29 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-29 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 201, 'activo');

-- Examen 16
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (16, 90, 4, 15, 'Biología Celular y Revolución Industrial II Examen', 65, TO_DATE('2024-05-30 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-30 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 26, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 214, 'activo');

-- Examen 17
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (17, 120, 5, 20, 'Evolución y Revolución Industrial II Examen', 70, TO_DATE('2024-05-31 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-31 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 4, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 213, 'activo');

-- Examen 18
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (18, 60, 3, 10, 'Imperio Romano Repaso II Examen', 75, TO_DATE('2024-06-01 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-06-01 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 11, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 200, 'activo');

-- Examen 19
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (19, 90, 4, 25, 'Biología Celular y Evolución Examen', 60, TO_DATE('2024-06-02 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-06-02 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 26, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 213, 'activo');

-- Examen 20
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (20, 75, 3, 20, 'Revolución Industrial Avanzado II Examen', 70, TO_DATE('2024-06-03 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-06-03 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 201, 'activo');

-- Examen 21
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (21, 90, 4, 15, 'Biología Celular y Revolución Industrial III Examen', 65, TO_DATE('2024-06-04 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-06-04 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 26, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 214, 'activo');

-- Examen 22
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (22, 120, 5, 20, 'Evolución y Revolución Industrial III Examen', 70, TO_DATE('2024-06-05 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-06-05 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 4, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 213, 'activo');

-- Examen 23
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (23, 60, 3, 10, 'Imperio Romano Repaso III Examen', 75, TO_DATE('2024-06-06 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-06-06 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 11, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 200, 'activo');

-- Examen 24
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (24, 90, 4, 25, 'Biología Celular y Evolución II Examen', 60, TO_DATE('2024-06-07 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-06-07 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 26, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 213, 'activo');

-- Examen 25
INSERT INTO examen (id_examen, tiempo_max, numero_preguntas, porcentaje_curso, nombre, porcentaje_aprobatorio, fecha_hora_inicio, fecha_hora_fin, num_preguntas_aleatorias, id_tema, id_docente, id_grupo, estado)
VALUES (25, 75, 3, 20, 'Revolución Industrial Avanzado III Examen', 70, TO_DATE('2024-06-08 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-06-08 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 201, 'activo');

-- PREGUNTA_EXAMEN

--examen 1
-- Pregunta 2 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 'f', 2, 1);

-- Pregunta 6 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (30, NULL, 'f', 6, 1);

-- Pregunta 9 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (50, NULL, 'f', 9, 1);


--pregunta adicional con su respuesta para que cuadre :V

INSERT INTO pregunta (id_pregunta, enunciado, es_publica, tipo_pregunta, id_pregunta_compuesta, id_tema, id_docente, estado)
VALUES (999, '¿la célula es la unidad mínima de vida?', 'S', 'falso_verdadero', NULL, 4, ROUND(DBMS_RANDOM.VALUE(1000, 1029)), 'creada');

INSERT INTO respuesta (id_respuesta, descripcion, es_verdadera, id_pregunta)
VALUES (999, 'verdadero', 't', 999);
---COntinuamos el viaje ;)

-- EXAMEN 2
-- Pregunta 3 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 'f', 3, 2);

-- Pregunta 7 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 'f', 7, 2);

-- Pregunta 15 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 'f', 15, 2);

-- Pregunta 18 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 'f', 18, 2);

-- Pregunta 23 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 'f', 23, 2);

-- EXAMEN 3
-- Pregunta 6 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 'f', 6, 3);

-- Pregunta 9 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 'f', 9, 3);

-- Pregunta 14 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 'f', 14, 3);

-- Pregunta 29 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 'f', 29, 3);

--EXAMEN 4

-- Pregunta 4 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 'f', 4, 4);

-- Pregunta 10 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 'f', 10, 4);

-- Pregunta 16 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (34, NULL, 'f', 16, 4);

--Examen 5

-- Pregunta 1 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 'f', 1, 5);

-- Pregunta 5 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (34, NULL, 'f', 5, 5);

-- Pregunta 11 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 'f', 11, 5);

--Examen 6

-- Pregunta 2 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 'f', 2, 6);

-- Pregunta 5 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 'f', 5, 6);

-- Pregunta 11 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 'f', 11, 6);

-- Pregunta 16 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 'f', 16, 6);

--Examen 7

-- Pregunta 2 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 'f', 2, 7);

-- Pregunta 9 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 'f', 9, 7);

-- Pregunta 14 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 'f', 14, 7);

-- Pregunta 19 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 'f', 19, 7);

-- Pregunta 24 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 'f', 25, 7);

--Examen 8

--Pregunta 7 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 'f', 7, 8);

-- Pregunta 10 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 'f', 11, 8);

-- Pregunta 15 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (34, NULL, 'f', 15, 8);

--Examen 9

-- Pregunta 2 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 'f', 2, 9);

-- Pregunta 6 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 'f', 6, 9);

-- Pregunta 9 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 'f', 9, 9);

-- Pregunta 14 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 'f', 20, 9);

--Examen 10
-- Pregunta 4 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 4, 10);

-- Pregunta 10 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 10, 10);

-- Pregunta 13 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (34, NULL, 't', 13, 10);

--Examen 11

-- Pregunta 1 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 1, 11);

-- Pregunta 5 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 5, 11);

-- Pregunta 11 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 11, 11);

-- Pregunta 16 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 16, 11);

-- Pregunta 21 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 21, 11);

--Examen 12

-- Pregunta 3 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 3, 12);

-- Pregunta 8 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 8, 12);

-- Pregunta 15 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 15, 12);

-- Pregunta 23 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 23, 12);
--Examen 13

-- Pregunta 2 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 2, 13);

-- Pregunta 6 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (34, NULL, 't', 6, 13);

-- Pregunta 29 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 29, 13);

--EXAMEN 14

-- Pregunta 5 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 5, 14);

-- Pregunta 11 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 11, 14);

-- Pregunta 16 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 16, 14);

-- Pregunta 21 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 21, 14);

--Examen 15

-- Pregunta 3 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 3, 15);

-- Pregunta 8 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (34, NULL, 't', 8, 15);

-- Pregunta 13 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 13, 15);

--Examen 16

-- Pregunta 2 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 2, 16);

-- Pregunta 6 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 6, 16);

-- Pregunta 29 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 29, 16);

-- Pregunta 9 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 9, 16);

--Examen 17

-- Pregunta 1 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 1, 17);

-- Pregunta 5 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 5, 17);

-- Pregunta 11 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 11, 17);

-- Pregunta 16 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 16, 17);

-- Pregunta 21 (Evolución)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 21, 17);

--Examen 18

-- Pregunta 3 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 3, 18);

-- Pregunta 8 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (34, NULL, 't', 8, 18);

-- Pregunta 13 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 13, 18);

--Examen 19
-- Pregunta 2 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 2, 19);

-- Pregunta 6 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 6, 19);

-- Pregunta 9 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 9, 19);

-- Pregunta 29 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 29, 19);

--Examen 20

-- Pregunta 4 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 4, 20);

-- Pregunta 8 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (34, NULL, 't', 8, 20);

-- Pregunta 13 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 13, 20);

--Examen 21

-- Pregunta 2 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 2, 21);

-- Pregunta 6 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 6, 21);

-- Pregunta 9 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 9, 21);

-- Pregunta 29 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 29, 21);

--Examen 22

-- Pregunta 3 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 3, 22);

-- Pregunta 8 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 8, 22);

-- Pregunta 13 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 13, 22);

-- Pregunta 18 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 18, 22);

-- Pregunta 24 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (20, NULL, 't', 24, 22);

--Examen 23

-- Pregunta 3 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 3, 23);

-- Pregunta 12 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (34, NULL, 't', 12, 23);

-- Pregunta 18 (Imperio Romano)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 18, 23);

--Examen 24

-- Pregunta 2 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 2, 24);

-- Pregunta 6 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 6, 24);

-- Pregunta 10 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 10, 24);

-- Pregunta 14 (Biología Celular)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (25, NULL, 't', 14, 24);

---Examen 25

-- Pregunta 4 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 4, 25);

-- Pregunta 9 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (33, NULL, 't', 9, 25);

-- Pregunta 19 (Revolución Industrial)
INSERT INTO pregunta_examen (porcentaje_examen, tiempo_pregunta, tiene_tiempo_maximo, id_pregunta, id_examen)
VALUES (34, NULL, 't', 19, 25);

-- PRESENTACION EXAMEN
-- Insertar datos en la tabla PRESENTACION_EXAMEN,
-- relacionando los exámenes especificados con los alumnos correspondientes.

--- Examen 2 (Imperio Romano Examen, Grupo 201)
INSERT INTO presentacion_examen (id_presentacion_examen, tiempo, terminado, calificacion, ip_source, fecha_hora_presentacion, id_examen, id_alumno)
VALUES (1, 30, '1', 45, '192.168.1.1', SYSDATE, 4, 1015);

-- Examen 3 (Evolución Examen, Grupo 200)
INSERT INTO presentacion_examen (id_presentacion_examen, tiempo, terminado, calificacion, ip_source, fecha_hora_presentacion, id_examen, id_alumno)
VALUES (2, 30, '1', 30, '192.168.1.1', SYSDATE, 3, 1000);

-- Examen 5 (Biología Celular Avanzado Examen, Grupo 214)
INSERT INTO presentacion_examen (id_presentacion_examen, tiempo, terminado, calificacion, ip_source, fecha_hora_presentacion, id_examen, id_alumno)
VALUES (3, 30, '1', 25, '192.168.1.1', SYSDATE, 5, 1015);

-- Examen 14 (Evolución y Revolución Industrial Examen, Grupo 213)
INSERT INTO presentacion_examen (id_presentacion_examen, tiempo, terminado, calificacion, ip_source, fecha_hora_presentacion, id_examen, id_alumno)
VALUES (4, 30, '1', 50, '192.168.1.1', SYSDATE, 14, 1000);

COMMIT;

-- Añadir filas a la tabla presentacion_pregunta
-- Asegurarse de que el script anterior se ha ejecutado para que las tablas tengan datos

-- Añadir filas a la tabla presentacion_pregunta
-- Asegurarse de que el script anterior se ha ejecutado para que las tablas tengan datos

-- INSERT INTO para presentacion_pregunta (40 filas)

-- Presentación de Examen 1 (Biología Celular Examen, Grupo 213)
INSERT INTO presentacion_pregunta (respuesta_correcta, id_pregunta, id_respuesta, id_presentacion_pregunta, id_presentacion_examen) VALUES ('t', 2, 2, 1, 1);
INSERT INTO presentacion_pregunta (respuesta_correcta, id_pregunta, id_respuesta, id_presentacion_pregunta, id_presentacion_examen) VALUES ('t', 6, 9, 2, 1);
INSERT INTO presentacion_pregunta (respuesta_correcta, id_pregunta, id_respuesta, id_presentacion_pregunta, id_presentacion_examen) VALUES ('f', 9, 67, 3, 1);
INSERT INTO presentacion_pregunta (respuesta_correcta, id_pregunta, id_respuesta, id_presentacion_pregunta, id_presentacion_examen) VALUES ('t', 14, 24, 4, 1);

-- Presentación de Examen 2 (Imperio Romano Examen, Grupo 201)
INSERT INTO presentacion_pregunta (respuesta_correcta, id_pregunta, id_respuesta, id_presentacion_pregunta, id_presentacion_examen) VALUES ('f', 3, 3, 5, 2);
INSERT INTO presentacion_pregunta (respuesta_correcta, id_pregunta, id_respuesta, id_presentacion_pregunta, id_presentacion_examen) VALUES ('t', 7, 11, 6, 2);
INSERT INTO presentacion_pregunta (respuesta_correcta, id_pregunta, id_respuesta, id_presentacion_pregunta, id_presentacion_examen) VALUES ('t', 15, 26, 7, 2);
INSERT INTO presentacion_pregunta (respuesta_correcta, id_pregunta, id_respuesta, id_presentacion_pregunta, id_presentacion_examen) VALUES ('t', 18, 32, 8, 2);

-- Presentación de Examen 3 (Evolución Examen, Grupo 200)
INSERT INTO presentacion_pregunta (respuesta_correcta, id_pregunta, id_respuesta, id_presentacion_pregunta, id_presentacion_examen) VALUES ('t', 1, 1, 9, 3);
INSERT INTO presentacion_pregunta (respuesta_correcta, id_pregunta, id_respuesta, id_presentacion_pregunta, id_presentacion_examen) VALUES ('t', 5, 54, 10, 3);
INSERT INTO presentacion_pregunta (respuesta_correcta, id_pregunta, id_respuesta, id_presentacion_pregunta, id_presentacion_examen) VALUES ('f', 21, 42, 11, 3);
INSERT INTO presentacion_pregunta (respuesta_correcta, id_pregunta, id_respuesta, id_presentacion_pregunta, id_presentacion_examen) VALUES ('t', 27, 58, 12, 3);

-- Presentación de Examen 4 (Biología Celular Avanzado Examen, Grupo 214)
INSERT INTO presentacion_pregunta (respuesta_correcta, id_pregunta, id_respuesta, id_presentacion_pregunta, id_presentacion_examen) VALUES ('t', 2, 2, 13, 4);
INSERT INTO presentacion_pregunta (respuesta_correcta, id_pregunta, id_respuesta, id_presentacion_pregunta, id_presentacion_examen) VALUES ('f', 6, 8, 14, 4);
INSERT INTO presentacion_pregunta (respuesta_correcta, id_pregunta, id_respuesta, id_presentacion_pregunta, id_presentacion_examen) VALUES ('t', 9, 66, 15, 4);
INSERT INTO presentacion_pregunta (respuesta_correcta, id_pregunta, id_respuesta, id_presentacion_pregunta, id_presentacion_examen) VALUES ('t', 20, 38, 16, 4);

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------

-- BLOQUE_HORARIO

-- Insertar bloques horarios en la tabla BLOQUE_HORARIO.

-- Iterar sobre los días de la semana (Lunes a Viernes).
DECLARE
v_id_bloque_horario NUMBER := 1; -- Contador del ID de bloque horario
BEGIN
FOR dia IN 1..5 LOOP
        -- Iterar sobre las horas del día (7AM a 8PM, excluyendo 1PM - 1:59PM).
        FOR hora IN 7..20 LOOP -- Cambiar el límite superior a 20
            -- Excluir el bloque de tiempo de 1PM a 1:59PM.
            IF hora != 13 THEN
                -- Calcular la hora de inicio y fin del bloque horario.
                DECLARE
v_hora_inicio VARCHAR2(10);
                    v_hora_fin VARCHAR2(10);
BEGIN
                    v_hora_inicio := TO_CHAR(hora, '09') || ':00:00';
                    v_hora_fin := TO_CHAR(hora + 2, '09') || ':00:00';

                    -- Insertar el bloque horario en la tabla.
INSERT INTO bloque_horario (id_bloque_horario, hora_inicio, hora_fin, lugar, dia)
VALUES (
           v_id_bloque_horario,
           TO_TIMESTAMP(v_hora_inicio, 'HH24:MI:SS'),
           TO_TIMESTAMP(v_hora_fin, 'HH24:MI:SS'),
           'Aula ' || (hora - 6), -- Asignar aulas secuencialmente (Aula 1, Aula 2, etc.)
           CASE dia
               WHEN 1 THEN 'l'
               WHEN 2 THEN 'm'
               WHEN 3 THEN 'x'
               WHEN 4 THEN 'j'
               WHEN 5 THEN 'v'
               END
       );

-- Incrementar el contador del ID de bloque horario
v_id_bloque_horario := v_id_bloque_horario + 1;
END;
END IF;
END LOOP;
END LOOP;

    -- Hacer commit de la transacción
COMMIT;
END;
/

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------


-- HORARIO

-- Relacionar dos bloques horarios a cada grupo.
BEGIN
FOR grupo_rec IN (SELECT id_grupo FROM grupo) LOOP
    FOR bloque_rec IN (
      SELECT id_bloque_horario
      FROM bloque_horario
      WHERE id_bloque_horario NOT IN (
        SELECT id_bloque_horario
        FROM horario
        WHERE id_grupo = grupo_rec.id_grupo
      )
      AND ROWNUM <= 2
    ) LOOP
      INSERT INTO horario (id_bloque_horario, id_grupo)
      VALUES (bloque_rec.id_bloque_horario, grupo_rec.id_grupo);
END LOOP;
END LOOP;
COMMIT;
END;
/


---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------


-- NOTA

-- Insertar registros en la tabla NOTA con calificación 0,
-- basándose en los registros de ALUMNO_GRUPO.

INSERT INTO nota (valor, id_grupo, ID_ALUMNO)
SELECT 0, ag.id_grupo, ag.ID_ALUMNO
FROM alumno_grupo ag;

COMMIT;
