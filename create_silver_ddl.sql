/*
==========================================================================
Create Tables on Silver Schema
==========================================================================
Script purpose:
    This script creates tables on database named 'Datawarehouse' from sources files after checking if tables already exists.
*/

use Datawarehouse;
Go

--Create the DDL for the file cust_info
IF OBJECT_ID('silver.crm_cust_info','U') IS NOT NULL
	DROP TABLE silver.crm_cust_info;
CREATE TABLE silver.crm_cust_info (
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATETIME
);

--Create the DDL for the file prd_info
IF OBJECT_ID('silver.crm_prd_info','U') IS NOT NULL
	DROP TABLE silver.crm_prd_info;
CREATE TABLE silver.crm_prd_info (
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost FLOAT,
	prd_line NVARCHAR(50),
	prd_start_dt DATETIME,
	prd_end_dt DATETIME
);

--Create the DDL for the file sales_details
IF OBJECT_ID('silver.crm_sales_details','U') IS NOT NULL
	DROP TABLE silver.crm_sales_details;
CREATE TABLE silver.crm_sales_details (
	sls_ord_num  NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt DATETIME,
	sls_ship_dt DATETIME,
	sls_due_dt DATETIME,
	sls_sales INT,
	sls_quantity INT,
	sls_price FLOAT
);


--Create the DDL for the file loc_a101
IF OBJECT_ID('silver.erp_loc_a101','U') IS NOT NULL
	DROP TABLE silver.erp_loc_a101;
CREATE TABLE silver.[erp_loc_a101](
	CID  NVARCHAR(50),
	CNTRY NVARCHAR(50)
);


--Create the DDL for the file cust_az12
IF OBJECT_ID('silver.erp_cust_az12','U') IS NOT NULL
	DROP TABLE silver.erp_cust_az12;
CREATE TABLE silver.erp_cust_az12 (
	CID  NVARCHAR(50),
	BDATE DATE,
	GEN NVARCHAR(20)
);

--Create the DDL for the file px_cat_g1v2
IF OBJECT_ID('silver.erp_px_cat_g1v2','U') IS NOT NULL
	DROP TABLE silver.erp_px_cat_g1v2;
CREATE TABLE silver.erp_px_cat_g1v2 (
	ID  NVARCHAR(50),
	CAT NVARCHAR(50),
	SUBCAT NVARCHAR(50),
	MAINTENANCE NVARCHAR(20)
);