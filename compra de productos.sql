CREATE VIEW Vista_Detalle_Compra_Productos AS
SELECT
    C.idCompra,
    C.fechaCompra,
    C.totalCompra AS TotalCompraFactura,
    C.metodoPago,
    C.estadoCompra,
    U.nombreUsuario AS EmpleadoRegistraCompra,
    DC.idDetalleCompra,
    Prod.nombreProducto,
    Prod.precioCompra AS CostoUnitarioProducto, -- Precio de compra del producto base
    DC.cantidad,
    DC.precioUnitario AS CostoUnitarioDetalle, -- Costo unitario real en el momento de la compra
    (DC.cantidad * DC.precioUnitario) AS SubtotalLineaCompra
FROM
    Compra AS C
JOIN
    Detalle_Compra AS DC ON C.idCompra = DC.idCompra
JOIN
    Producto AS Prod ON DC.idProducto = Prod.idProducto
JOIN
    Usuario AS U ON C.idUsuario = U.idUsuario;