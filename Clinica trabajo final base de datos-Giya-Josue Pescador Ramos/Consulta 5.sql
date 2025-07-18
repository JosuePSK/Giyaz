-- Contar cuántas citas tiene cada médico
SELECT m.nombres, m.apellidos, COUNT(c.id_cita) AS total_citas
FROM medico m
LEFT JOIN cita c ON m.id_medico = c.id_medico
GROUP BY m.id_medico, m.nombres, m.apellidos;
