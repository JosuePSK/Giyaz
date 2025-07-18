CREATE VIEW Vista_Informacion_Trabajadores AS
SELECT
    idUsuario,
    nombreUsuario,
    correo,
    rol
FROM
    Usuario;