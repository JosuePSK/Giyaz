CREATE DATABASE giya;
USE giya;

CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY,
    nombreUsuario VARCHAR(100),
    correo VARCHAR(100),
    rol VARCHAR(50),
    contraseña VARCHAR(100)
);

CREATE TABLE Proveedor (
    idProveedor INT PRIMARY KEY,
    nombre VARCHAR(100),
    rut VARCHAR(20),
    correo VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE Producto (
    idProducto INT PRIMARY KEY,
    idProveedor INT,
    nombre VARCHAR(100),
    descripcion TEXT,
    precioCompra DECIMAL(10, 2),
    precioVenta DECIMAL(10, 2),
    stock INT,
    FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor)
);

CREATE TABLE Compra (
    idCompra INT PRIMARY KEY,
    idUsuario INT,
    fechaCompra DATE,
    totalCompra DECIMAL(10, 2),
    metodoPago VARCHAR(50),
    estadoCompra VARCHAR(50),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

CREATE TABLE Detalle_Compra (
    idDetalleCompra INT PRIMARY KEY,
    idCompra INT,
    idProducto INT,
    cantidad INT,
    precioUnitario DECIMAL(10, 2),
    FOREIGN KEY (idCompra) REFERENCES Compra(idCompra),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

CREATE TABLE Venta (
    idVenta INT PRIMARY KEY,
    idUsuario2 INT,
    fechaVenta DATE,
    totalVenta DECIMAL(10, 2),
    metodoPago VARCHAR(50),
    estadoVenta VARCHAR(50),
    FOREIGN KEY (idUsuario2) REFERENCES Usuario(idUsuario)
);

CREATE TABLE Detalle_Venta (
    idDetalleVenta INT PRIMARY KEY,
    idVenta INT,
    idProducto INT,
    cantidad INT,
    precioUnitario DECIMAL(10, 2),
    FOREIGN KEY (idVenta) REFERENCES Venta(idVenta),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

USE giya;


INSERT INTO Usuario (idUsuario, nombreUsuario, correo, rol, contraseña) VALUES
(1, 'admin', 'admin@giya.com', 'Administrador', 'admin123'),
(2, 'juanperez', 'juan@giya.com', 'Empleado', 'juan123'),
(3, 'maria', 'maria@giya.com', 'Empleado', 'maria123');


INSERT INTO Proveedor (idProveedor, nombre, rut, correo, telefono) VALUES
(1, 'Proveedor Uno', '12345678-9', 'proveedor1@correo.com', '123456789'),
(2, 'Proveedor Dos', '98765432-1', 'proveedor2@correo.com', '987654321');


INSERT INTO Producto (idProducto, idProveedor, nombre, descripcion, precioCompra, precioVenta, stock) VALUES
(1, 1, 'Lápiz', 'Lápiz grafito HB', 100.00, 150.00, 500),
(2, 2, 'Cuaderno', 'Cuaderno universitario 100 hojas', 1200.00, 1800.00, 200),
(3, 1, 'Goma de borrar', 'Goma blanca pequeña', 50.00, 100.00, 300);


INSERT INTO Compra (idCompra, idUsuario, fechaCompra, totalCompra, metodoPago, estadoCompra) VALUES
(1, 1, '2025-06-01', 10000.00, 'Efectivo', 'Completada'),
(2, 2, '2025-06-02', 3000.00, 'Tarjeta', 'Pendiente');


INSERT INTO Detalle_Compra (idDetalleCompra, idCompra, idProducto, cantidad, precioUnitario) VALUES
(1, 1, 1, 50, 100.00),
(2, 1, 3, 20, 50.00),
(3, 2, 2, 2, 1200.00);


INSERT INTO Venta (idVenta, idUsuario2, fechaVenta, totalVenta, metodoPago, estadoVenta) VALUES
(1, 2, '2025-06-05', 3600.00, 'Transferencia', 'Completada'),
(2, 3, '2025-06-06', 900.00, 'Efectivo', 'Pendiente');

INSERT INTO Detalle_Venta (idDetalleVenta, idVenta, idProducto, cantidad, precioUnitario) VALUES
(1, 1, 2, 2, 1800.00),
(2, 2, 3, 3, 100.00);

USE giya;


CREATE USER 'giya_empleado'@'localhost' IDENTIFIED BY 'empleado_pass';

GRANT SELECT, INSERT, UPDATE ON giya.Producto TO 'giya_empleado'@'localhost';
GRANT SELECT, INSERT, UPDATE ON giya.Compra TO 'giya_empleado'@'localhost';
GRANT SELECT, INSERT, UPDATE ON giya.Detalle_Compra TO 'giya_empleado'@'localhost';
GRANT SELECT, INSERT, UPDATE ON giya.Venta TO 'giya_empleado'@'localhost';
GRANT SELECT, INSERT, UPDATE ON giya.Detalle_Venta TO 'giya_empleado'@'localhost';

CREATE USER 'giya_auditor'@'localhost' IDENTIFIED BY 'auditor_pass';


GRANT SELECT ON giya.* TO 'giya_auditor'@'localhost';

FLUSH PRIVILEGES;


CREATE VIEW Vista_Ventas_Detalladas AS
SELECT
    V.idVenta,
    V.fechaVenta,
    U.nombreUsuario AS vendedor,
    P.nombre AS nombreProducto,
    DV.cantidad,
    DV.precioUnitario AS precioUnitarioVenta,
    (DV.cantidad * DV.precioUnitario) AS subtotalProducto,
    V.totalVenta,
    V.metodoPago,
    V.estadoVenta
FROM
    Venta AS V
JOIN
    Detalle_Venta AS DV ON V.idVenta = DV.idVenta
JOIN
    Producto AS P ON DV.idProducto = P.idProducto
JOIN
    Usuario AS U ON V.idUsuario2 = U.idUsuario;

DELIMITER //
CREATE PROCEDURE ContarVentasPorFecha(
    IN p_fecha DATE,
    OUT p_totalVentas INT
)
BEGIN
    SELECT COUNT(idVenta)
    INTO p_totalVentas
    FROM Venta
    WHERE fechaVenta = p_fecha;
END //
DELIMITER ;