-- Crear base de datos
CREATE DATABASE IF NOT EXISTS pruebas;
USE pruebas;

-- Crear tabla alumnos desde cero
DROP TABLE IF EXISTS alumnos;

CREATE TABLE alumnos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    dni VARCHAR(9) UNIQUE,
    nacionalidad VARCHAR(50),
    edad INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO alumnos (nombre, apellido, dni, email, nacionalidad, edad)
VALUES
('Juan', 'Gómez', '12345678', 'juan.gomez@gmail.com', 'Argentina', 22),
('Jimena', 'Ramirez', '23456789', 'jimena.r@gmail.com', 'Chile', 19),
('Andrés', 'Martinez', '34567890', 'andres.m@hotmail.com', 'Uruguay', 25),
('María del Carmen', 'Pérez', '45678901', 'mariacdelc@gmail.com', 'Argentina', 31),
('Carlos', 'Delgado', '56789012', 'carlos_d@yahoo.com', 'Chile', 27),
('Lucía', 'Fernandez', '67890123', 'lucia.fernandez@gmail.com', 'Uruguay', 20),
('Pedro', 'Vazquez', '78901234', 'pedrovzq@gmail.com', 'Paraguay', 30),
('Valeria', 'Juarez', '89012345', 'valeria.j@hotmail.com', 'Argentina', 24),
('Ana', 'Lopez', '90123456', 'ana.lopez@gmail.com', 'Bolivia', 21),
('Miguel del Río', 'Mendez', '11223344', 'miguel.rio@outlook.com', 'Argentina', 28),
('Damián', 'Torres', '22334455', 'damian.torres@gmail.com', 'Chile', 18),
('Sofía', 'Benitez', '33445566', 'sofia_benitez@gmail.com', 'Uruguay', 23);
CREATE TABLE IF NOT EXISTS cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre_curso VARCHAR(100) NOT NULL
);
INSERT INTO cursos (nombre_curso)
VALUES
('SQL Avanzado'),
('Python Inicial'),
('Java para Backend'),
('Machine Learning'),
('Diseño Web'),
('Inglés Técnico');
CREATE TABLE IF NOT EXISTS inscripciones(
    id_alumnos INT,
    id_curso INT,
    inscription_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_alumnos, id_curso),
    FOREIGN KEY (id_alumnos) REFERENCES alumnos(id),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);
INSERT INTO inscripciones (id_alumnos, id_curso, inscription_at)
VALUES
(1, 1, '2023-03-10'),
(2, 2, '2022-07-15'),
(3, 3, '2023-11-01'),
(4, 1, '2024-01-20'),
(5, 2, '2024-12-10'),
(6, 4, '2023-12-15'),
(7, 1, '2024-06-20'),
(8, 3, '2024-09-25'),
(9, 5, '2025-06-01'),
(10, 6, '2025-07-01'),
(11, 4, '2025-07-10'),
(12, 1, '2024-03-03');

SELECT * FROM inscripciones
