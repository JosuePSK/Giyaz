-- Ver todas las citas programadas con detalles
SELECT 
  c.id_cita, 
  p.nombres AS paciente, 
  m.nombres AS medico, 
  e.nombre AS especialidad, 
  c.fecha_cita, 
  c.hora_cita, 
  c.estado
FROM cita c
JOIN paciente p ON c.id_paciente = p.id_paciente
JOIN medico m ON c.id_medico = m.id_medico
JOIN especialidad e ON m.id_especialidad = e.id_especialidad;
