-- Listar todos los médicos junto con su especialidad
SELECT m.id_medico, m.nombres, m.apellidos, e.nombre AS especialidad, m.consultorio, m.horario
FROM medico m
JOIN especialidad e ON m.id_especialidad = e.id_especialidad;
