--Optimización de base de datos
CREATE INDEX IX_Ventas_FechaVenta
ON Ventas(FechaVenta)
INCLUDE (Total, Estado);

ALTER TABLE Productos
ADD CONSTRAINT CK_Productos_Precio CHECK (Precio > 0);

ALTER TABLE Productos
ADD CONSTRAINT CK_Productos_Stock CHECK (Stock >= 0);