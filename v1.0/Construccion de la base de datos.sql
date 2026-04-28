-- Creacion DB TechStore y sus respectivas tablas

USE master;
GO

IF DB_ID('TechStore') IS NOT NULL
BEGIN
    ALTER DATABASE TechStore SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE TechStore;
END
GO

CREATE DATABASE TechStore;
GO

USE TechStore;
GO
