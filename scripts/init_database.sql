/*
==========================================================================
Create database and Schemas
==========================================================================
Script purpose:
    This script creates a new  database named 'Datawarehouse' after checking if it already exists.
    Additionally ,the script creates 3 schemas 'bronze','silver','gold'.

WARNINGS:
    Running this script will drop the entire 'Datawarehouse' database if it exists.
    Proceed this caution and ensure you have a back up  before running this script.
*/

--create database 'Datawarehouse'
use master
Go

--DROP and recreate the DATABASE 'Datawarehouse';
IF EXISTS (SELECT 1 FROM sys.databases where name ='Datawarehouse')
  BEGIN 
    ALTER DATABASE Datawarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Datawarehouse;
END;
GO

-- create the 'Datawarehouse' database
  CREATE DATABASE Datawarehouse;
  GO

  
use Datawarehouse;
Go
---create medaillon schema
CREATE SCHEMA  bronze;
GO
CREATE SCHEMA  silver;
GO
CREATE SCHEMA  gold;
GO

