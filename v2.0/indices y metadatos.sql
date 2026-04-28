CREATE TABLE Clientes (
    ClienteID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) NOT NULL,
    Telefono NVARCHAR(20),
    Ciudad NVARCHAR(80),
    FechaRegistro DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE Productos (
    ProductoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(120) NOT NULL,
    Categoria NVARCHAR(80) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL,
    Activo BIT DEFAULT 1
);
GO

CREATE TABLE Empleados (
    EmpleadoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Cargo NVARCHAR(80) NOT NULL,
    Email NVARCHAR(150),
    Salario DECIMAL(10,2) NOT NULL
);
GO

CREATE TABLE Ventas (
    VentaID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT NOT NULL,
    EmpleadoID INT NOT NULL,
    FechaVenta DATETIME DEFAULT GETDATE(),
    Total DECIMAL(10,2) NOT NULL,
    Estado NVARCHAR(30) DEFAULT 'Completada',

    CONSTRAINT FK_Ventas_Clientes 
        FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),

    CONSTRAINT FK_Ventas_Empleados 
        FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);
GO

CREATE TABLE DetalleVentas (
    DetalleID INT IDENTITY(1,1) PRIMARY KEY,
    VentaID INT NOT NULL,
    ProductoID INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_DetalleVentas_Ventas 
        FOREIGN KEY (VentaID) REFERENCES Ventas(VentaID),

    CONSTRAINT FK_DetalleVentas_Productos 
        FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);
GO

-- Tabla tarjeta clientes ============================================================


CREATE TABLE TarjetasClientes (
    TarjetaID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT NOT NULL,
    NumeroTarjeta NVARCHAR(30) NOT NULL,
    FechaVencimiento NVARCHAR(10) NOT NULL,
    CVV NVARCHAR(5) NOT NULL,

    CONSTRAINT FK_TarjetasClientes_Clientes
        FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);
GO

-- Insercion de datos en cada tabla

INSERT INTO Clientes (Nombre, Email, Telefono, Ciudad)
VALUES
('Daniel Ortega', 'daniel@correo.com', '7777-1111', 'Estelí'),
('Sofía Martínez', 'sofia@correo.com', '7777-2222', 'Rivas'),
('Kevin López', 'kevin@correo.com', '7777-3333', 'Jinotepe'),
('Laura Gutiérrez', 'laura@correo.com', '7777-4444', 'Matagalpa'),
('Pedro Castillo', 'pedro@correo.com', '7777-5555', 'Boaco');
GO

INSERT INTO Productos (Nombre, Categoria, Precio, Stock)
VALUES
('Laptop HP Pavilion', 'Computadoras', 780.00, 10),
('Mouse Razer', 'Accesorios', 25.00, 60),
('Teclado Logitech K120', 'Accesorios', 20.00, 90),
('Monitor Samsung 27"', 'Monitores', 250.00, 18),
('Disco Duro Seagate 2TB', 'Almacenamiento', 110.00, 25),
('Memoria RAM 8GB', 'Componentes', 45.00, 70),
('Impresora Epson EcoTank', 'Impresoras', 200.00, 8);
GO

INSERT INTO Empleados (Nombre, Cargo, Email, Salario)
VALUES
('Fernando Ruiz', 'Vendedor', 'fernando@techstore.com', 600.00),
('Gabriela Flores', 'Vendedora', 'gabriela@techstore.com', 720.00),
('Andrés Morales', 'Administrador', 'andres@techstore.com', 1300.00);
GO

INSERT INTO Ventas (ClienteID, EmpleadoID, FechaVenta, Total, Estado)
VALUES
(1, 2, '2026-04-01', 805.00, 'Completada'),
(2, 1, '2026-04-02', 275.00, 'Completada'),
(3, 3, '2026-04-03', 110.00, 'Pendiente'),
(4, 2, '2026-04-04', 250.00, 'Cancelada'),
(5, 1, '2026-04-05', 200.00, 'Completada');
GO

INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario)
VALUES
(1, 1, 1, 780.00),
(1, 2, 1, 25.00),
(2, 3, 1, 20.00),
(2, 4, 1, 250.00),
(3, 5, 1, 110.00),
(4, 6, 2, 45.00),
(5, 7, 1, 200.00);
GO

INSERT INTO TarjetasClientes (ClienteID, NumeroTarjeta, FechaVencimiento, CVV)
VALUES
(1, '4222222222222222', '01/29', '321'),
(2, '5333333333333333', '02/28', '654'),
(3, '4555555555555555', '03/30', '987');
GO

-- Consultar datos ingresados en cada tabla
USE TechStore;
GO

-- Ver clientes
SELECT * FROM Clientes;
GO

-- Ver productos
SELECT * FROM Productos;
GO

-- Ver empleados
SELECT * FROM Empleados;
GO

-- Ver ventas
SELECT * FROM Ventas;
GO

-- Ver detalle de ventas
SELECT * FROM DetalleVentas;
GO

-- Ver tarjetas de clientes
SELECT * FROM TarjetasClientes;
GO