CREATE DATABASE giya;
USE giya;

CREATE TABLE usuario (
    idUsuario INT PRIMARY KEY,
    nombreUsuario VARCHAR(100),
    correo VARCHAR(100),
    rol VARCHAR(50),
    contraseña VARCHAR(100)
);

CREATE TABLE proveedor (
    idProveedor INT PRIMARY KEY,
    nombreProveedor VARCHAR(100),
    rut VARCHAR(20),
    correo VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE producto (
    idProducto INT PRIMARY KEY,
    idProveedor INT,
    nombreProducto VARCHAR(100),
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

CREATE TABLE venta (
    idVenta INT PRIMARY KEY,
    idUsuario INT,
    fechaVenta DATE,
    totalVenta DECIMAL(10, 2),
    metodoPago VARCHAR(50),
    estadoVenta VARCHAR(50),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);






CREATE TABLE detalle_venta (
    idDetalleVenta INT PRIMARY KEY,
    idVenta INT,
    idProducto INT,
    cantidad INT,
    precioUnitario DECIMAL(10, 2),
    FOREIGN KEY (idVenta) REFERENCES Venta(idVenta),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);
-- Tabla Usuario
INSERT INTO usuario (idUsuario, nombreUsuario, correo, rol, contraseña)
VALUES
(1, 'Admin', 'admin@giya.com', 'Administrador', 'admin123'),
(2, 'Juan ', 'juan@giya.com', 'EB', 'juan456'),
(3, 'maria', 'maria@giya.com', 'Cajero', 'maria789'),
(4, 'Pedro', 'pedro@giya.com', 'Cajero', 'pedroabc'),
(5, 'Ana', 'ana@giya.com', 'Administrador', 'ana1234');
-- Tabla Proveedor
INSERT INTO proveedor (idProveedor, nombreProveedor, rut, correo, telefono)
VALUES
(1, 'Cocacola', '12345678-9', 'abc@proveedor.com', '3101234567'),
(2, 'Ramo', '98765432-1', 'xyz@proveedor.com', '3127654321'),
(3, 'Poker', '24363634-4', 'axcproveedor.com', '3065677839'),
(4, 'Bimbo Colombia', '860000000-1', 'ventas@bimbo.com.co', '6013214567'),
(5, 'Alpina Productos Alimenticios', '860000000-2', 'contacto@alpina.com', '6017890123'),
(6, 'Nestlé Colombia', '860000000-3', 'info@nestle.com.co', '6015554321');
-- Tabla Producto
INSERT INTO producto (idProducto, idProveedor, nombreProducto, descripcion, precioCompra, precioVenta, stock)
VALUES
(1, 1, 'Teclado', 'Teclado USB mecánico', 50000, 70000, 25),
(2, 2, 'Mouse', 'Mouse óptico inalámbrico', 30000, 45000, 40),
(3, 4, 'Pan de Leche', 'Pan blanco suave ideal para sándwiches', 4500, 6000, 100),
(4, 5, 'Yogurt Griego Fresa', 'Yogurt griego descremado con trozos de fresa', 2800, 4000, 75),
(5, 4, 'Ponqué Ramo Tradicional', 'Bizcocho clásico de Ramo', 3000, 4500, 50),
(6, 6, 'Café Soluble Nescafe', 'Café instantáneo clásico', 15000, 22000, 30),
(7, 1, 'Agua mineral botella 500ml', 'Agua purificada natural', 1000, 2000, 150);
-- Tabla Compra
INSERT INTO compra (idCompra, idUsuario, fechaCompra, totalCompra, metodoPago, estadoCompra)
VALUES
(1, 1, '2025-06-15', 100000, 'Efectivo', 'Completada'),
(3, 1, '2025-07-01', 250000.00, 'Crédito', 'Completada'),
(4, 2, '2025-07-05', 150000.00, 'Efectivo', 'Pendiente'),
(5, 5, '2025-07-08', 300000.00, 'Transferencia', 'Completada');
-- Tabla Detalle_Compra
INSERT INTO detalle_compra (idDetalleCompra, idCompra, idProducto, cantidad, precioUnitario)
VALUES
(1, 1, 1, 1, 50000),
(2, 1, 2, 1, 50000),
(3, 3, 3, 40, 4500.00), -- Pan de Leche
(4, 3, 4, 30, 2800.00), -- Yogurt Griego
(5, 4, 5, 20, 3000.00), -- Ponqué Ramo
(6, 4, 7, 50, 1000.00), -- Agua mineral
(7, 5, 6, 15, 15000.00); -- Café Soluble
-- Tabla Venta
INSERT INTO venta (idVenta, idUsuario, fechaVenta, totalVenta, metodoPago, estadoVenta)
VALUES
(1, 2, '2025-06-17', 115000, 'Tarjeta', 'Completada'),
(3, 2, '2025-07-02', 10000.00, 'Efectivo', 'Completada'),
(4, 3, '2025-07-03', 15000.00, 'Tarjeta Débito', 'Completada'),
(5, 1, '2025-07-06', 7500.00, 'Efectivo', 'Completada'),
(6, 2, '2025-07-07', 22000.00, 'Tarjeta Crédito', 'Completada');
-- Tabla Detalle_Venta
INSERT INTO detalle_venta (idDetalleVenta, idVenta, idProducto, cantidad, precioUnitario)
VALUES
(1, 1, 1, 1, 70000),
(2, 1, 2, 1, 45000),
(3, 3, 3, 1, 6000.00),  -- 1 Pan de Leche
(4, 3, 4, 1, 4000.00),  -- 1 Yogurt Griego
(5, 4, 5, 2, 4500.00),  -- 2 Ponqué Ramo
(6, 4, 7, 3, 2000.00),  -- 3 Aguas minerales
(7, 5, 3, 1, 6000.00),  -- 1 Pan de Leche
(8, 5, 7, 1, 2000.00),  -- 1 Agua mineral
(9, 6, 6, 1, 22000.00); -- 1 Café Soluble