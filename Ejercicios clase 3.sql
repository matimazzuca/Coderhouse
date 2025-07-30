SELECT c.nombre_curso, COUNT(i.id_alumnos)
FROM cursos c
LEFT JOIN inscripciones i ON c.id_cursos = i.id_curso
GROUP BY nombre_curso;

SELECT nombre 
FROM alumnos
WHERE nombre LIKE "J%";

SELECT nombre, apellido
FROM alumnos 
WHERE apellido LIKE "%ez";

SELECT nombre, email 
FROM alumnos 
WHERE email LIKE "%@gmail.com";

SELECT nombre
FROM alumnos
WHERE nombre REGEXP '^.{5}$';

SELECT nombre 
FROM alumnos
WHERE nombre REGEXP '^[AM].*del';

SELECT nombre
FROM alumnos 
WHERE nombre NOT REGEXP "^[DV]";

SELECT nombre
FROM alumnos
WHERE id IN (
SELECT id_alumnos 
FROM inscripciones
);

SELECT nombre
FROM alumnos
WHERE id NOT IN (
SELECT id_alumnos 
FROM inscripciones
);

SELECT nombre_curso
FROM cursos
WHERE id_curso IN (
SELECT id_curso 
FROM inscripciones
GROUP BY id_curso
HAVING COUNT(id_curso) > 3
);

SELECT nombre, apellido
FROM alumnos
WHERE edad IN( 
SELECT MIN(edad)
FROM alumnos);

SELECT nombre, apellido
FROM alumnos
WHERE edad > ( 
SELECT AVG(edad)
FROM alumnos);

SELECT UPPER(nombre)
FROM alumnos;

SELECT apellido, CHAR_LENGTH(apellido) 
FROM alumnos;

SELECT CONCAT(nombre, " ", apellido) AS nombre_completo
FROM alumnos;

SELECT ABS(MAX(edad) - MIN(edad)) AS diferencia_absoluta
FROM alumnos;

SELECT AVG(edad) 
FROM alumnos;

SELECT nombre, apellido, YEAR(created_at)
FROM alumnos;

SELECT a.nombre, a.apellido, i.inscription_at
FROM inscripciones i
JOIN alumnos a ON a.id = i.id_alumnos
WHERE i.inscription_at < DATE_SUB(NOW(), INTERVAL 1 YEAR);

SELECT CONCAT(a.nombre, " ", a.apellido) AS nombre, DATEDIFF(NOW(), i.inscription_at) AS dias_transcurridos
FROM inscripciones i 
JOIN alumnos a ON a.id = i.id_alumnos;

SELECT a.nombre, a.apellido
FROM alumnos a 
INNER JOIN inscripciones i ON a.id = i.id_alumnos
WHERE DATE_SUB(NOW(), INTERVAL 1 MONTH);

SELECT a.nombre, a.apellido,
DATE_FORMAT(i.inscription_at, "%d/%m/%Y")
FROM inscripciones i 
INNER JOIN alumnos a ON a.id = i.id_alumnos;

SELECT a.nombre, a.apellido, DATE_FORMAT(i.inscription_at, "%Y") AS año
FROM inscripciones i
INNER JOIN alumnos a ON a.id = i.id_alumnos
WHERE YEAR(inscription_at) = 2023;

ALTER TABLE alumnos
ADD COLUMN telefono VARCHAR(10);

SELECT * FROM estudiantes;

ALTER TABLE alumnos
RENAME COLUMN telefono TO celular;

ALTER TABLE alumnos
DROP COLUMN email;

TRUNCATE TABLE inscripciones;

RENAME TABLE alumnos TO estudiantes;

DROP TABLE cursos