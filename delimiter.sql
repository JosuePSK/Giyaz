DELIMITER //

CREATE PROCEDURE InsertarvuevaVenta(
    IN p_idUsuario INT,
    IN p_fechaVenta DATETIME,
    IN p_metodoPago VARCHAR(50),
    IN p_totalVenta DECIMAL(10, 2),
    IN p_idProducto INT,
    IN p_cantidad INT,
    IN p_precioUnitario DECIMAL(10, 2)
)
BEGIN
    DECLARE v_idVenta INT;
    DECLARE v_subtotalProducto DECIMAL(10, 2);

    INSERT INTO Venta (idUsuario2, fechaVenta, totalVenta, metodoPago, estadoVenta)
    VALUES (p_idUsuario, p_fechaVenta, p_totalVenta, p_metodoPago, 'Completada');

    SET v_subtotalProducto = p_cantidad * p_precioUnitario;

    -- 2. Insertar el detalle de la venta para el producto
    INSERT INTO Detalle_Venta (idVenta, idProducto, cantidad, precioUnitario)
    VALUES (v_idVenta, p_idProducto, p_cantidad, p_precioUnitario);

END //

DELIMITER ;
