USE TechStore;
GO
BACKUP DATABASE TechStore
TO DISK = 'C:\Backups\TechStore_DIFF.bak'
WITH 
    DIFFERENTIAL,
    INIT,
    NAME = 'Respaldo diferencial de TechStore',
    STATS = 10;
GO