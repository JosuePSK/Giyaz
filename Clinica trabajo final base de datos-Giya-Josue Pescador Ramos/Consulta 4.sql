-- 3. Mostrar todas las citas de un paciente específico (por nombre)
SELECT c.id_cita, c.fecha_cita, c.hora_cita, c.estado, m.nombres AS medico
FROM cita c
JOIN paciente p ON c.id_paciente = p.id_paciente
JOIN medico m ON c.id_medico = m.id_medico
WHERE p.nombres = 'Carlos';