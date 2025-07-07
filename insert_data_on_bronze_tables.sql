USE Datawarehouse;
GO
/*
==========================================================================
Insert data into bronze'schema tables by BULK INSERT Mode
==========================================================================
Script purpose:
    This script insert data with bulk mode after truncating the target table.

WARNINGS:
     Additionally ,it' important to create a script to test the integrity of the data to avoid error.

	1)compare records of the file vs table
	2)compare columns order of the file vs table
	3) check if column number contain separator to avoid mismatch on table column, if it's the case replace it by different separator
*/

CREATE OR ALTER PROCEDURE bronze.load_src_files AS
BEGIN
	PRINT'==============================================';
	PRINT'Loading Bronze Layer Files';
	PRINT'==============================================';

	PRINT'----------------------------------------------';
	PRINT'Loading CRM Files';
	PRINT'----------------------------------------------';

	---Truncate table bronze.crm_cust_info 
	PRINT'>> Truncating Table :bronze.crm_cust_info <<';
	TRUNCATE TABLE bronze.crm_cust_info;
	---BULK INSERT for bronze.crm_cust_info
	PRINT'>> Inserting data into Table :bronze.crm_cust_info <<';
	BULK INSERT bronze.crm_cust_info
	FROM 'C:\Users\cnani\OneDrive\Documents\Business Intelligence\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK -- to lock the table during the insertion it's imprve performance

	);
	--Truncate table bronze.crm_prd_info 
	PRINT'>> Truncating Table :bronze.crm_prd_info <<';
	TRUNCATE TABLE bronze.crm_prd_info;
	---BULK INSERT for bronze.crm_prd_info
	PRINT'>> Inserting data into Table :bronze.crm_prd_info <<';
	BULK INSERT bronze.crm_prd_info
	FROM 'C:\Users\cnani\OneDrive\Documents\Business Intelligence\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK -- to lock the table during the insertion it's imprve performance

	);

	-- Truncate table bronze.crm_sales_details
	PRINT'>> Truncating Table :bronze.crm_sales_details <<';
	TRUNCATE TABLE bronze.crm_sales_details;
	---BULK INSERT for bronze.crm_sales_details
	PRINT'>> Inserting data into Table :bronze.crm_sales_details <<';
	BULK INSERT bronze.crm_sales_details
	FROM 'C:\Users\cnani\OneDrive\Documents\Business Intelligence\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK -- to lock the table during the insertion it's imprve performance

	);

	PRINT'----------------------------------------------';
	PRINT'Loading ERP Files';
	PRINT'----------------------------------------------';

	--Truncata table bronze.erp_loc_a101
	PRINT'>> Truncating Table :bronze.erp_loc_a101 <<';
	TRUNCATE TABLE bronze.erp_loc_a101;
	---BULK INSERT for bronze.erp_loc_a101
	PRINT'>> Inserting data into Table :bronze.erp_loc_a101 <<';
	BULK INSERT bronze.erp_loc_a101
	FROM 'C:\Users\cnani\OneDrive\Documents\Business Intelligence\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK -- to lock the table during the insertion it's imprve performance

	);


	---Truncate table bronze.erp_cust_az12
	PRINT'>> Truncating Table :bronze.erp_cust_az12 <<';
	TRUNCATE TABLE bronze.erp_cust_az12;
	---BULK INSERT for bronze.erp_cust_az12
	PRINT'>> Inserting data into Table :bronze.erp_cust_az12 <<';
	BULK INSERT bronze.erp_cust_az12
	FROM 'C:\Users\cnani\OneDrive\Documents\Business Intelligence\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK -- to lock the table during the insertion it's imprve performance

	);

	---Truncate table bronze.erp_px_cat_g1v2
	PRINT'>> Truncating Table :bronze.erp_px_cat_g1v2 <<';
	TRUNCATE TABLE bronze.erp_px_cat_g1v2;
	---BULK INSERT for bronze.erp_px_cat_g1v2
	PRINT'>> Inserting data into Table :bronze.erp_px_cat_g1v2 <<';
	BULK INSERT bronze.erp_px_cat_g1v2
	FROM 'C:\Users\cnani\OneDrive\Documents\Business Intelligence\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK -- to lock the table during the insertion it's imprve performance

	);
END