CREATE DATABASE IF NOT EXISTS pruebas; 
USE pruebas;
CREATE TABLE IF NOT EXISTS alumnos(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
email VARCHAR(100) UNIQUE,
dni VARCHAR(9) UNIQUE,
nacionalidad VARCHAR(100) DEFAULT "Argentina"
);

-- DROP TABLE alumnos

INSERT INTO alumnos(nombre, apellido, dni, email, nacionalidad)
     VALUES
     ("Matias", "Mazzuca", "44444444", "matimazzuca@gmail.com", "Chile"),
     ("Tomás", "Suarez", "45555555", "tomass@gmail.com", "Chile"),
     ("Jimena", "Gonzales", "47290897", "jimenagonzales@gmail.com", "Argentina");
     
     
     SELECT id, nombre, apellido, dni, email, nacionalidad FROM alumnos;

-- DROP TABLE alumnos;
-- creando tabla de cursos
CREATE TABLE IF NOT EXISTS cursos(
id_cursos INT PRIMARY KEY AUTO_INCREMENT,
nombre_curso VARCHAR(50) NOT NULL
);

INSERT INTO cursos(nombre_curso) VALUES
("sql"),
("python"),
("java")
;

-- relacionar tablas con FOREIGN KEY e INNER JOIN

CREATE TABLE IF NOT EXISTS inscripciones(
id_alumnos INT,
id_curso INT,
inscription_at DATETIME DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id_alumnos, id_curso),
FOREIGN KEY (id_alumnos) REFERENCES alumnos(id),
FOREIGN KEY (id_curso) REFERENCES cursos(id_cursos)
);

SELECT * FROM alumnos;

-- REALIZAR INSCRIPCIONES CON INSERT 

INSERT INTO inscripciones(id_alumnos, id_curso) VALUES
(1,1),(1,2),(1,3),(2,1),(3,2),(3,3)
;

SELECT * FROM inscripciones;

-- MOSTRANDO LAS PERSONAS Y A QUE CURSOS SE ANOTARON, RELACIONANDO inscripciones, alumnos Y cursos

SELECT a.nombre, a.apellido, a.dni, c.nombre_curso
FROM alumnos a -- se pone el alias sin el AS
INNER JOIN inscripciones i ON a.id = i.id_alumnos
INNER JOIN cursos c ON i.id_curso = c.id_cursos;

-- LEFT JOIN = le da prioridad al orden de la izquierda
-- RIGHT JOIN = le da prioridad al orden de la derecha
-- UNION = da ambas prioridades mostrando toda la info

SELECT a.nombre, a.apellido, a.dni, c.nombre_curso
FROM alumnos a 
LEFT JOIN inscripciones i ON a.id = i.id_alumnos
LEFT JOIN cursos c ON i.id_curso = c.id_cursos

UNION

SELECT a.nombre, a.apellido, a.dni, c.nombre_curso
FROM alumnos a 
RIGHT JOIN inscripciones i ON a.id = i.id_alumnos
RIGHT JOIN cursos c ON i.id_curso = c.id_cursos;

SELECT c.nombre_curso, COUNT(i.id_alumnos)
FROM cursos c
LEFT JOIN inscripciones i ON c.id_cursos = i.id_curso
GROUP BY nombre_curso;



-- ---------------------------------------------------- --

/*
uso de LIKE, COMODINES y REGEX
*/

INSERT INTO alumnos(nombre, apellido, dni, email, nacionalidad)
VALUES
 ("Marcelo", "Mazzuca", "44455444", "marce@gmail.com", "Brasil"),
     ("Thiago", "Su", "45599555", "thiagg@gmail.com", "Chile"),
     ("Jara", "Goma", "47879897", "jaragoma@gmail.com", "Peru")
;
-- comprobar que nombres empiezan con "M"
SELECT *
FROM alumnos
WHERE nombre LIKE "M%" -- el "%" es el "comodín"
ORDER BY nombre ASC;
-- comprobar todos los alumnos con la letra "m" adentro del nombre
SELECT *
FROM alumnos
WHERE nombre LIKE "%M%"
ORDER BY nombre ASC;
-- REGEXP
SELECT *
FROM alumnos
WHERE nombre REGEXP "[A-M]" -- esta mal
ORDER BY apellido DESC;
-- Subconsultas SQL

-- Consulta normal
SELECT * FROM alumnos;
-- adentro le podemos meter otra consulta
SELECT nombre, apellido, dni
FROM alumnos
WHERE edad = (SELECT MAX(edad) FROM alumnos);

-- Funciones de texto
SELECT UPPER(email) AS email_mayúscula, nombre, LOWER(apellido) AS apellido_minúscula, id
FROM alumnos
WHERE id > (SELECT AVG(id) FROM alumnos);

SELECT a.nombre, a.apellido, i.inscription_at AS fecha_de_inscripcion
FROM alumnos a
INNER JOIN inscripciones i ON a.id = i.id_alumnos
WHERE i.inscription_at < DATE_SUB(NOW(), INTERVAL 1 YEAR)
