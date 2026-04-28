--Creación de login y usuario

USE master;
GO

IF EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'techstore_app')
    DROP LOGIN techstore_app;
GO

IF EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'analista_ventas')
    DROP LOGIN analista_ventas;
GO

IF EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'invitado_consulta')
    DROP LOGIN invitado_consulta;
GO

CREATE LOGIN techstore_app 
WITH PASSWORD = 'TechStore123',
CHECK_POLICY = OFF;
GO

CREATE LOGIN analista_ventas 
WITH PASSWORD = 'Analista123',
CHECK_POLICY = OFF;
GO

CREATE LOGIN invitado_consulta 
WITH PASSWORD = 'Invitado123',
CHECK_POLICY = OFF;
GO

USE TechStore;
GO

CREATE USER techstore_app FOR LOGIN techstore_app;
CREATE USER analista_ventas FOR LOGIN analista_ventas;
CREATE USER invitado_consulta FOR LOGIN invitado_consulta;
GO