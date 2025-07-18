-- Crear la base de datos
CREATE DATABASE clinica_citas;
USE clinica_citas;

-- Tabla: especialidad
CREATE TABLE especialidad (
  id_especialidad INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50),
  descripcion TEXT
);

-- Tabla: medico
CREATE TABLE medico (
  id_medico INT PRIMARY KEY AUTO_INCREMENT,
  nombres VARCHAR(50),
  apellidos VARCHAR(50),
  id_especialidad INT,
  consultorio VARCHAR(10),
  horario VARCHAR(100),
  FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad)
);

-- Tabla: paciente
CREATE TABLE paciente (
  id_paciente INT PRIMARY KEY AUTO_INCREMENT,
  nombres VARCHAR(50),
  apellidos VARCHAR(50),
  telefono VARCHAR(20),
  correo VARCHAR(100),
  fecha_nacimiento DATE
);

-- Tabla: cita
CREATE TABLE cita (
  id_cita INT PRIMARY KEY AUTO_INCREMENT,
  id_paciente INT,
  id_medico INT,
  fecha_cita DATE,
  hora_cita TIME,
  estado VARCHAR(20),
  FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
  FOREIGN KEY (id_medico) REFERENCES medico(id_medico)
);

-- Insertar especialidad
INSERT INTO especialidad (nombre, descripcion)
VALUES ('Pediatría', 'Atención médica a niños');

-- Insertar médico
INSERT INTO medico (nombres, apellidos, id_especialidad, consultorio, horario)
VALUES ('Laura', 'Martínez', 1, '302A', 'Lunes a Viernes 8am - 4pm');

-- Insertar paciente
INSERT INTO paciente (nombres, apellidos, telefono, correo, fecha_nacimiento)
VALUES ('Carlos', 'Ramos', '3124567890', 'carlos@example.com', '1990-05-20');

-- Insertar cita
INSERT INTO cita (id_paciente, id_medico, fecha_cita, hora_cita, estado)
VALUES (1, 1, '2025-07-18', '10:00:00', 'Programada');
