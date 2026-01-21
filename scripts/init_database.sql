/*
=====================================================
Create Database and Schemas
=====================================================
Script purpose:
This script creates a new db named 'DataWarehouse' after checking if it already exists.
If the db exists, it is dropped and recreated. Additionally, the script sets up 3 schemas within the db: bronze, silver, and gold.

WARNINNG:
Running this script will drop the entire 'DataWarehouse' db if it exists.
All data in the db will be permanently deleted. Proceed with caution and ensure you have proper backups before running this script.
*/


-- Create Database 'DataWarehouse'
USE master;
--Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
  BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE DataWarehouse;
END;
GO

--Create DataWarehouse
CREATE DATABASE DataWarehouse;
GO
  
USE DataWarehouse;
GO

  --Create Schemas
CREATE SCHEMA bronze;
GO
  
CREATE SCHEMA silver;
GO
  
CREATE SCHEMA gold;
GO
