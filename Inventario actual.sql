CREATE VIEW Vista_Inventario_Actual AS
SELECT
    P.idProducto,
    P.nombreProducto,
    P.descripcion,
    P.stock AS StockActual,
    P.precioCompra,
    P.precioVenta,
    Prov.nombreProveedor AS ProveedorPrincipal,
    Prov.telefono AS TelefonoProveedor
FROM
    Producto AS P
LEFT JOIN
    Proveedor AS Prov ON P.idProveedor = Prov.idProveedor;