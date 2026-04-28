-- Permisos para usuario
ALTER ROLE db_owner ADD MEMBER techstore_app;
GO
-- Permisos para usuario
ALTER ROLE db_owner ADD MEMBER analista_ventas;GO
-- Permisos para usuario
ALTER ROLE db_datareader ADD MEMBER invitado_consulta;
GO
-- Rol creado
CREATE ROLE rol_reportes;
GO
-- Agregando permisos a rol
ALTER ROLE rol_reportes ADD MEMBER analista_ventas;
GO
ALTER DATABASE TechStore SET RECOVERY SIMPLE;
GO
