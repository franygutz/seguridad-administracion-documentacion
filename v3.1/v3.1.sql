ALTER DATABASE TechStore SET RECOVERY SIMPLE; 
GO  
BACKUP DATABASE TechStore TO DISK = 'C:\base_datos\TechStore_Full_20260428.bak' 
WITH INIT, 
NAME = 'TechStore Full Backup 2026-04-28', 
STATS = 10; 
GO