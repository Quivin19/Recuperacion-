
-- Crear base de datos
CREATE DATABASE Veterinaria;
USE Veterinaria;

-- Crear tabla Personas
CREATE TABLE Personas (
    id_persona INT AUTO_INCREMENT PRIMARY KEY,
    nombre_persona VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    dui_persona VARCHAR(10) UNIQUE NOT NULL
);

-- Crear tabla Mascotas
CREATE TABLE Mascotas (
    id_mascota INT AUTO_INCREMENT PRIMARY KEY,
    nombre_mascota VARCHAR(50) NOT NULL,
    raza_mascota VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL
);

-- Crear tabla Dueños_Mascota para relaciones muchos a muchos entre Personas y Mascotas
CREATE TABLE Duenios_Mascota (
    id_duenios_mascota INT AUTO_INCREMENT PRIMARY KEY,
    id_mascota INT NOT NULL,
    id_persona INT NOT NULL,
    FOREIGN KEY (id_mascota) REFERENCES Mascotas(id_mascota) ON DELETE CASCADE,
    FOREIGN KEY (id_persona) REFERENCES Personas(id_persona) ON DELETE CASCADE
);

-- Insertar datos en la tabla Personas
INSERT INTO Personas (nombre_persona, fecha_nacimiento, dui_persona) VALUES
    ('Bryan Miranda', '2001-11-19', '01371021-5'),
    ('Víctor Huezo', '2000-11-21', '08371021-6'),
    ('Ricardo Peña', '2001-11-19', '08971033-7'),
    ('Josué Granados', '1998-11-11', '08371021-5'),
    ('Daniela Fernanda', '1999-12-31', '05968586-7');

-- Insertar datos en la tabla Mascotas
INSERT INTO Mascotas (nombre_mascota, raza_mascota, fecha_nacimiento) VALUES
    ('Firulais', 'Labrador', '2015-05-10'),
    ('Manchas', 'Bulldog', '2018-07-15'),
    ('Pelusa', 'Persa', '2017-09-21');

-- Asignar mascotas a clientes específicos
INSERT INTO Duenios_Mascota (id_mascota, id_persona)
SELECT m.id_mascota, p.id_persona
FROM Mascotas m
JOIN Personas p ON p.dui_persona = '08971033-7'
WHERE m.nombre_mascota = 'Firulais';

INSERT INTO Duenios_Mascota (id_mascota, id_persona)
SELECT m.id_mascota, p.id_persona
FROM Mascotas m
JOIN Personas p ON p.dui_persona = '08371021-6'
WHERE m.nombre_mascota = 'Manchas';

INSERT INTO Duenios_Mascota (id_mascota, id_persona)
SELECT m.id_mascota, p.id_persona
FROM Mascotas m
JOIN Personas p ON p.dui_persona = '05968586-7'
WHERE m.nombre_mascota = 'Pelusa';

-- Cambiar la fecha de nacimiento para un cliente específico
UPDATE Personas
SET fecha_nacimiento = '1998-09-11'
WHERE dui_persona = '01371021-5';

-- Eliminar cliente con un DUI específico
DELETE FROM Personas
WHERE dui_persona = '08371021-6';
