CREATE VIEW Vista_Ventas_Por_Empleado AS
SELECT
    U.idUsuario,
    U.nombreUsuario AS Empleado,
    U.rol,
    COUNT(V.idVenta) AS NumeroDeVentas,
    SUM(V.totalVenta) AS MontoTotalVendido
FROM
    Venta AS V
JOIN
    Usuario AS U ON V.idUsuario2 = U.idUsuario
GROUP BY
    U.idUsuario, U.nombreUsuario, U.rol
ORDER BY
    MontoTotalVendido DESC;