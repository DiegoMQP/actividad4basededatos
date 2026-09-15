-- =====================================================================
-- SCRIPT SQL: Sistema de Administración Hospitalaria (HospitalDB)
-- Descripción: Creación de tablas, restricciones, inserción de registros
-- y consultas analíticas requeridas para el caso de estudio.
-- =====================================================================

CREATE DATABASE IF NOT EXISTS HospitalDB;
USE HospitalDB;

-- =====================================================================
-- 1. CREACIÓN DE TABLAS (DDL)
-- =====================================================================

-- Tabla de Empleados
CREATE TABLE Empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    tipo_empleado ENUM('Enfermero Titular', 'Auxiliar de Enfermería', 'Guardia', 'Administrativo') NOT NULL,
    nombre_completo VARCHAR(150) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    nss VARCHAR(20) NOT NULL
);

-- Tabla de Médicos
CREATE TABLE Medicos (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    tipo_medico ENUM('Titular', 'Interino', 'Sustituto') NOT NULL,
    nombre_completo VARCHAR(150) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    nss VARCHAR(20) NOT NULL,
    cedula VARCHAR(20) NOT NULL
);

-- Tabla de Horarios de Médicos
CREATE TABLE Horarios_Medicos (
    id_horario INT AUTO_INCREMENT PRIMARY KEY,
    id_medico INT NOT NULL,
    dia_semana ENUM('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo') NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico) ON DELETE CASCADE
);

-- Tabla de Sustituciones (Solo para médicos sustitutos)
CREATE TABLE Sustituciones (
    id_sustitucion INT AUTO_INCREMENT PRIMARY KEY,
    id_medico INT NOT NULL,
    fecha_alta DATE NOT NULL,
    fecha_baja DATE NOT NULL,
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico) ON DELETE CASCADE
);

-- Tabla de Pacientes
CREATE TABLE Pacientes (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    id_medico INT NOT NULL,
    nombre_completo VARCHAR(150) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    nss VARCHAR(20) NOT NULL,
    fecha_ingreso DATE NOT NULL,
    fecha_analisis DATE NULL,
    fecha_intervencion DATE NULL,
    fecha_alta DATE NULL,
    historial_clinico TEXT NULL,
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico)
);

-- Tabla de Vacaciones de Médicos
CREATE TABLE Vacaciones_Medicos (
    id_vacacion INT AUTO_INCREMENT PRIMARY KEY,
    id_medico INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estado ENUM('Planeadas', 'Realizadas') NOT NULL,
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico) ON DELETE CASCADE
);


-- =====================================================================
-- 2. INSERCIÓN DE DATOS (30 REGISTROS POR TABLA)
-- =====================================================================

-- 30 Registros para Médicos
INSERT INTO Medicos (tipo_medico, nombre_completo, direccion, telefono, ciudad, estado, codigo_postal, nss, cedula) VALUES
('Sustituto', 'Dr. Alberto Ruiz', 'Calle 1', '5551234501', 'CDMX', 'CDMX', '01000', 'NSS01', 'CED01'),
('Interino', 'Dra. Beatriz Lopez', 'Calle 2', '5551234502', 'CDMX', 'CDMX', '01000', 'NSS02', 'CED02'),
('Sustituto', 'Dr. Carlos Slim', 'Calle 3', '5551234503', 'GDL', 'Jalisco', '44100', 'NSS03', 'CED03'),
('Interino', 'Dra. Diana Paz', 'Calle 4', '5551234504', 'MTY', 'NL', '64000', 'NSS04', 'CED04'),
('Titular', 'Dr. Esteban Rey', 'Calle 5', '5551234505', 'CDMX', 'CDMX', '01000', 'NSS05', 'CED05'),
('Titular', 'Dra. Fabiola Gil', 'Calle 6', '5551234506', 'CDMX', 'CDMX', '01000', 'NSS06', 'CED06'),
('Interino', 'Dr. Gerardo Saez', 'Calle 7', '5551234507', 'CDMX', 'CDMX', '01000', 'NSS07', 'CED07'),
('Sustituto', 'Dra. Hilda Flor', 'Calle 8', '5551234508', 'CDMX', 'CDMX', '01000', 'NSS08', 'CED08'),
('Titular', 'Dr. Ignacio Sol', 'Calle 9', '5551234509', 'CDMX', 'CDMX', '01000', 'NSS09', 'CED09'),
('Interino', 'Dra. Julia Mar', 'Calle 10', '5551234510', 'CDMX', 'CDMX', '01000', 'NSS10', 'CED10'),
('Titular','Dr. Med 11','Dir 11','5550000011','Ciudad','Estado','00000','NSS11','CED11'),
('Titular','Dr. Med 12','Dir 12','5550000012','Ciudad','Estado','00000','NSS12','CED12'),
('Interino','Dr. Med 13','Dir 13','5550000013','Ciudad','Estado','00000','NSS13','CED13'),
('Sustituto','Dr. Med 14','Dir 14','5550000014','Ciudad','Estado','00000','NSS14','CED14'),
('Titular','Dr. Med 15','Dir 15','5550000015','Ciudad','Estado','00000','NSS15','CED15'),
('Titular','Dr. Med 16','Dir 16','5550000016','Ciudad','Estado','00000','NSS16','CED16'),
('Interino','Dr. Med 17','Dir 17','5550000017','Ciudad','Estado','00000','NSS17','CED17'),
('Sustituto','Dr. Med 18','Dir 18','5550000018','Ciudad','Estado','00000','NSS18','CED18'),
('Titular','Dr. Med 19','Dir 19','5550000019','Ciudad','Estado','00000','NSS19','CED19'),
('Titular','Dr. Med 20','Dir 20','5550000020','Ciudad','Estado','00000','NSS20','CED20'),
('Interino','Dr. Med 21','Dir 21','5550000021','Ciudad','Estado','00000','NSS21','CED21'),
('Sustituto','Dr. Med 22','Dir 22','5550000022','Ciudad','Estado','00000','NSS22','CED22'),
('Titular','Dr. Med 23','Dir 23','5550000023','Ciudad','Estado','00000','NSS23','CED23'),
('Titular','Dr. Med 24','Dir 24','5550000024','Ciudad','Estado','00000','NSS24','CED24'),
('Interino','Dr. Med 25','Dir 25','5550000025','Ciudad','Estado','00000','NSS25','CED25'),
('Sustituto','Dr. Med 26','Dir 26','5550000026','Ciudad','Estado','00000','NSS26','CED26'),
('Titular','Dr. Med 27','Dir 27','5550000027','Ciudad','Estado','00000','NSS27','CED27'),
('Titular','Dr. Med 28','Dir 28','5550000028','Ciudad','Estado','00000','NSS28','CED28'),
('Interino','Dr. Med 29','Dir 29','5550000029','Ciudad','Estado','00000','NSS29','CED29'),
('Sustituto','Dr. Med 30','Dir 30','5550000030','Ciudad','Estado','00000','NSS30','CED30');

-- Vacaciones estratégicas para las consultas
INSERT INTO Vacaciones_Medicos (id_medico, fecha_inicio, fecha_fin, estado) VALUES
(1, '2024-02-10', '2024-02-15', 'Realizadas'), 
(1, '2024-04-10', '2024-04-15', 'Realizadas'), 
(1, '2024-06-10', '2024-06-15', 'Realizadas'), 
(2, '2024-03-01', '2024-03-06', 'Realizadas'),
(2, '2024-05-01', '2024-05-02', 'Realizadas'),
(2, '2024-08-01', '2024-08-05', 'Realizadas'),
(3, '2025-02-15', '2025-02-25', 'Planeadas'),
(4, '2024-11-10', '2024-11-20', 'Planeadas');

-- 30 Registros para Pacientes
INSERT INTO Pacientes (id_medico, nombre_completo, direccion, telefono, codigo_postal, nss, fecha_ingreso, fecha_analisis, fecha_intervencion, fecha_alta, historial_clinico) VALUES
(3, 'Paciente Carlos (Intervención)', 'Dir P1', '55599901', '01000', 'NSSP01', '2025-02-10', '2025-02-12', '2025-02-20', '2025-02-28', 'Fractura de tibia izquierda, requiere cirugía y rehabilitación de 6 meses.'),
(4, 'Paciente Diana (Análisis)', 'Dir P2', '55599902', '01000', 'NSSP02', '2024-11-05', '2024-11-15', NULL, '2024-11-22', 'Cuadro de asma leve, se receta broncodilatador y reposo.'),
(1, 'Paciente Alberto Alfa', 'Dir P3', '55599903', '01000', 'NSSP03', '2024-01-01', NULL, NULL, NULL, 'Paciente con antecedente de hipertensión. Exámenes de sangre en orden.'),
(2, 'Paciente Beatriz Bravo', 'Dir P4', '55599904', '01000', 'NSSP04', '2024-01-01', NULL, NULL, NULL, 'Chequeo general de rutina. El paciente presenta un cuadro de estrés agudo.'),
(5, 'Paciente Esteban Echo', 'Dir P5', '55599905', '01000', 'NSSP05', '2024-01-01', NULL, NULL, NULL, 'Intervención de apendicitis exitosa. Paciente en recuperación.'),
(6, 'Pac 6', 'Dir P6', '55599906', '01000', 'NSSP06', '2024-01-01', NULL, NULL, NULL, NULL),
(7, 'Pac 7', 'Dir P7', '55599907', '01000', 'NSSP07', '2024-01-01', NULL, NULL, NULL, NULL),
(8, 'Pac 8', 'Dir P8', '55599908', '01000', 'NSSP08', '2024-01-01', NULL, NULL, NULL, NULL),
(9, 'Pac 9', 'Dir P9', '55599909', '01000', 'NSSP09', '2024-01-01', NULL, NULL, NULL, NULL),
(10, 'Pac 10', 'Dir P10', '55599910', '01000', 'NSSP10', '2024-01-01', NULL, NULL, NULL, NULL),
(11, 'Pac 11', 'Dir P11', '55599911', '01000', 'NSSP11', '2024-01-01', NULL, NULL, NULL, NULL),
(12, 'Pac 12', 'Dir P12', '55599912', '01000', 'NSSP12', '2024-01-01', NULL, NULL, NULL, NULL),
(13, 'Pac 13', 'Dir P13', '55599913', '01000', 'NSSP13', '2024-01-01', NULL, NULL, NULL, NULL),
(14, 'Pac 14', 'Dir P14', '55599914', '01000', 'NSSP14', '2024-01-01', NULL, NULL, NULL, NULL),
(15, 'Pac 15', 'Dir P15', '55599915', '01000', 'NSSP15', '2024-01-01', NULL, NULL, NULL, NULL),
(16, 'Pac 16', 'Dir P16', '55599916', '01000', 'NSSP16', '2024-01-01', NULL, NULL, NULL, NULL),
(17, 'Pac 17', 'Dir P17', '55599917', '01000', 'NSSP17', '2024-01-01', NULL, NULL, NULL, NULL),
(18, 'Pac 18', 'Dir P18', '55599918', '01000', 'NSSP18', '2024-01-01', NULL, NULL, NULL, NULL),
(19, 'Pac 19', 'Dir P19', '55599919', '01000', 'NSSP19', '2024-01-01', NULL, NULL, NULL, NULL),
(20, 'Pac 20', 'Dir P20', '55599920', '01000', 'NSSP20', '2024-01-01', NULL, NULL, NULL, NULL),
(21, 'Pac 21', 'Dir P21', '55599921', '01000', 'NSSP21', '2024-01-01', NULL, NULL, NULL, NULL),
(22, 'Pac 22', 'Dir P22', '55599922', '01000', 'NSSP22', '2024-01-01', NULL, NULL, NULL, NULL),
(23, 'Pac 23', 'Dir P23', '55599923', '01000', 'NSSP23', '2024-01-01', NULL, NULL, NULL, NULL),
(24, 'Pac 24', 'Dir P24', '55599924', '01000', 'NSSP24', '2024-01-01', NULL, NULL, NULL, NULL),
(25, 'Pac 25', 'Dir P25', '55599925', '01000', 'NSSP25', '2024-01-01', NULL, NULL, NULL, NULL),
(26, 'Pac 26', 'Dir P26', '55599926', '01000', 'NSSP26', '2024-01-01', NULL, NULL, NULL, NULL),
(27, 'Pac 27', 'Dir P27', '55599927', '01000', 'NSSP27', '2024-01-01', NULL, NULL, NULL, NULL),
(28, 'Pac 28', 'Dir P28', '55599928', '01000', 'NSSP28', '2024-01-01', NULL, NULL, NULL, NULL),
(29, 'Pac 29', 'Dir P29', '55599929', '01000', 'NSSP29', '2024-01-01', NULL, NULL, NULL, NULL),
(30, 'Pac 30', 'Dir P30', '55599930', '01000', 'NSSP30', '2024-01-01', NULL, NULL, NULL, NULL);

-- 30 Registros para Empleados
INSERT INTO Empleados (tipo_empleado, nombre_completo, direccion, telefono, ciudad, estado, codigo_postal, nss) VALUES
('Enfermero Titular', 'Emp 1', 'Dir 1', '555', 'CDMX', 'CDMX', '000', 'NSS1'),
('Auxiliar de Enfermería', 'Emp 2', 'Dir 2', '555', 'CDMX', 'CDMX', '000', 'NSS2'),
('Guardia', 'Emp 3', 'Dir 3', '555', 'CDMX', 'CDMX', '000', 'NSS3'),
('Administrativo', 'Emp 4', 'Dir 4', '555', 'CDMX', 'CDMX', '000', 'NSS4'),
('Enfermero Titular', 'Emp 5', 'Dir 5', '555', 'CDMX', 'CDMX', '000', 'NSS5'),
('Enfermero Titular', 'Emp 6', 'Dir 6', '555', 'CDMX', 'CDMX', '000', 'NSS6'),
('Auxiliar de Enfermería', 'Emp 7', 'Dir 7', '555', 'CDMX', 'CDMX', '000', 'NSS7'),
('Guardia', 'Emp 8', 'Dir 8', '555', 'CDMX', 'CDMX', '000', 'NSS8'),
('Administrativo', 'Emp 9', 'Dir 9', '555', 'CDMX', 'CDMX', '000', 'NSS9'),
('Enfermero Titular', 'Emp 10', 'Dir 10', '555', 'CDMX', 'CDMX', '000', 'NSS10'),
('Auxiliar de Enfermería', 'Emp 11', 'Dir 11', '555', 'C', 'E', '0', 'N11'), 
('Guardia', 'Emp 12', 'Dir 12', '555', 'C', 'E', '0', 'N12'), 
('Administrativo', 'Emp 13', 'Dir 13', '555', 'C', 'E', '0', 'N13'), 
('Enfermero Titular', 'Emp 14', 'Dir 14', '555', 'C', 'E', '0', 'N14'), 
('Auxiliar de Enfermería', 'Emp 15', 'Dir 15', '555', 'C', 'E', '0', 'N15'), 
('Guardia', 'Emp 16', 'Dir 16', '555', 'C', 'E', '0', 'N16'), 
('Administrativo', 'Emp 17', 'Dir 17', '555', 'C', 'E', '0', 'N17'), 
('Enfermero Titular', 'Emp 18', 'Dir 18', '555', 'C', 'E', '0', 'N18'), 
('Auxiliar de Enfermería', 'Emp 19', 'Dir 19', '555', 'C', 'E', '0', 'N19'), 
('Guardia', 'Emp 20', 'Dir 20', '555', 'C', 'E', '0', 'N20'), 
('Administrativo', 'Emp 21', 'Dir 21', '555', 'C', 'E', '0', 'N21'), 
('Enfermero Titular', 'Emp 22', 'Dir 22', '555', 'C', 'E', '0', 'N22'), 
('Auxiliar de Enfermería', 'Emp 23', 'Dir 23', '555', 'C', 'E', '0', 'N23'), 
('Guardia', 'Emp 24', 'Dir 24', '555', 'C', 'E', '0', 'N24'), 
('Administrativo', 'Emp 25', 'Dir 25', '555', 'C', 'E', '0', 'N25'), 
('Enfermero Titular', 'Emp 26', 'Dir 26', '555', 'C', 'E', '0', 'N26'), 
('Auxiliar de Enfermería', 'Emp 27', 'Dir 27', '555', 'C', 'E', '0', 'N27'), 
('Guardia', 'Emp 28', 'Dir 28', '555', 'C', 'E', '0', 'N28'), 
('Administrativo', 'Emp 29', 'Dir 29', '555', 'C', 'E', '0', 'N29'), 
('Enfermero Titular', 'Emp 30', 'Dir 30', '555', 'C', 'E', '0', 'N30');


-- =====================================================================
-- 3. CONSULTAS SOLICITADAS
-- =====================================================================

-- Consulta 1: Médicos con vacaciones en 2024 hasta antes de julio (orden alfabético)
SELECT DISTINCT m.nombre_completo 
FROM Medicos m
JOIN Vacaciones_Medicos v ON m.id_medico = v.id_medico
WHERE v.fecha_inicio >= '2024-01-01' AND v.fecha_inicio < '2024-07-01'
ORDER BY m.nombre_completo ASC;

-- Consulta 2: Médicos interinos y sustitutos con tres periodos vacacionales
SELECT m.nombre_completo 
FROM Medicos m
JOIN Vacaciones_Medicos v ON m.id_medico = v.id_medico
WHERE m.tipo_medico IN ('Interino', 'Sustituto')
GROUP BY m.id_medico
HAVING COUNT(v.id_vacacion) = 3;

-- Consulta 3: Médicos con 3 periodos y al menos uno de menos de 3 días
SELECT m.nombre_completo 
FROM Medicos m
JOIN Vacaciones_Medicos v ON m.id_medico = v.id_medico
WHERE m.tipo_medico IN ('Interino', 'Sustituto')
GROUP BY m.id_medico
HAVING COUNT(v.id_vacacion) = 3 
   AND SUM(CASE WHEN DATEDIFF(v.fecha_fin, v.fecha_inicio) < 3 THEN 1 ELSE 0 END) >= 1;

-- Consulta 4: Médicos sustitutos con vacaciones en febrero, abril y junio
SELECT m.nombre_completo 
FROM Medicos m
JOIN Vacaciones_Medicos v ON m.id_medico = v.id_medico
WHERE m.tipo_medico = 'Sustituto'
GROUP BY m.id_medico
HAVING SUM(CASE WHEN MONTH(v.fecha_inicio) = 2 THEN 1 ELSE 0 END) > 0
   AND SUM(CASE WHEN MONTH(v.fecha_inicio) = 4 THEN 1 ELSE 0 END) > 0
   AND SUM(CASE WHEN MONTH(v.fecha_inicio) = 6 THEN 1 ELSE 0 END) > 0;

-- Consulta 5: Médicos de vacaciones en Feb/Mar 2025 y cruce con intervenciones
SELECT 
    m.nombre_completo AS Medico, 
    v.fecha_inicio AS Inicio_Vacaciones, 
    v.fecha_fin AS Fin_Vacaciones, 
    p.nombre_completo AS Paciente, 
    p.fecha_intervencion
FROM Medicos m
JOIN Vacaciones_Medicos v ON m.id_medico = v.id_medico
JOIN Pacientes p ON m.id_medico = p.id_medico
WHERE (MONTH(v.fecha_inicio) IN (2, 3) AND YEAR(v.fecha_inicio) = 2025)
  AND p.fecha_intervencion BETWEEN v.fecha_inicio AND v.fecha_fin;

-- Consulta 6: Médicos sustitutos en vacaciones (Feb/Mar 2025) ordenados por fecha de intervención
SELECT 
    m.nombre_completo AS Medico_Sustituto, 
    v.fecha_inicio, 
    v.fecha_fin, 
    p.nombre_completo AS Paciente, 
    p.fecha_intervencion
FROM Medicos m
JOIN Vacaciones_Medicos v ON m.id_medico = v.id_medico
JOIN Pacientes p ON m.id_medico = p.id_medico
WHERE (MONTH(v.fecha_inicio) IN (2, 3) AND YEAR(v.fecha_inicio) = 2025)
  AND p.fecha_intervencion BETWEEN v.fecha_inicio AND v.fecha_fin
  AND m.tipo_medico = 'Sustituto'
ORDER BY p.fecha_intervencion ASC;

-- Consulta 7: Médicos interinos en vacaciones cruzadas con análisis clínicos de pacientes
SELECT 
    m.nombre_completo AS Medico_Interino, 
    v.fecha_inicio, 
    v.fecha_fin, 
    p.nombre_completo AS Paciente, 
    p.fecha_analisis
FROM Medicos m
JOIN Vacaciones_Medicos v ON m.id_medico = v.id_medico
JOIN Pacientes p ON m.id_medico = p.id_medico
WHERE m.tipo_medico = 'Interino'
  AND p.fecha_analisis BETWEEN v.fecha_inicio AND v.fecha_fin;

-- Consulta del historial clínico de los pacientes ordenados alfabéticamente
SELECT nombre_completo, historial_clinico 
FROM Pacientes
WHERE historial_clinico IS NOT NULL
ORDER BY nombre_completo ASC;
