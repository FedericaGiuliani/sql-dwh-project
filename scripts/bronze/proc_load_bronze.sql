EXEC bronze.load_bronze

CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN                                           --store procedure
PRINT'================================';
PRINT 'Loading Bronze layer';
PRINT'================================';

PRINT'================================';
PRINT 'Loading CRM Tables';
PRINT'================================';
TRUNCATE TABLE bronze.crm_cust_info;

BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\federica.giuliani\OneDrive - Horsa spa\Desktop\Microsoft and Data Platform\datasets_dwh_projects\source_crm\cust_info.csv'
WITH(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);

SELECT * FROM bronze.crm_cust_info

SELECT count(*) FROM bronze.crm_cust_info
------------------------------------------
TRUNCATE TABLE bronze.crm_prod_info;
BULK INSERT bronze.crm_prod_info
FROM 'C:\Users\federica.giuliani\OneDrive - Horsa spa\Desktop\Microsoft and Data Platform\datasets_dwh_projects\source_crm\prd_info.csv'
WITH(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);


UPDATE bronze.crm_prod_info
SET
    prd_start_dt = CONVERT(date, prd_start_dt, 101),
    prd_end_dt   = CONVERT(date, prd_end_dt,   101);


ALTER TABLE bronze.crm_prod_info
ALTER COLUMN prd_start_dt DATE;

ALTER TABLE bronze.crm_prod_info
ALTER COLUMN prd_end_dt DATE;

------------------------------------------

DBCC USEROPTIONS; /* Per vedere le impostazioni es. tipo di data che sa leggere*/

TRUNCATE TABLE bronze.crm_sales_details;
BULK INSERT bronze.crm_sales_details
FROM 'C:\Users\federica.giuliani\OneDrive - Horsa spa\Desktop\Microsoft and Data Platform\datasets_dwh_projects\source_crm\sales_details.csv'
WITH(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);

-----------------------------------------
PRINT'================================';
PRINT 'Loading CRM Tables';
PRINT'================================';
TRUNCATE TABLE bronze.erp_cust;
BULK INSERT bronze.erp_cust
FROM 'C:\Users\federica.giuliani\OneDrive - Horsa spa\Desktop\Microsoft and Data Platform\datasets_dwh_projects\source_erp\CUST_AZ12.csv'
WITH(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);
-----------------------------------------
TRUNCATE TABLE bronze.erp_loc;
BULK INSERT bronze.erp_loc
FROM 'C:\Users\federica.giuliani\OneDrive - Horsa spa\Desktop\Microsoft and Data Platform\datasets_dwh_projects\source_erp\LOC_A101.csv'
WITH(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);
-----------------------------------------
TRUNCATE TABLE bronze.erp_price_cat;
BULK INSERT bronze.erp_price_cat
FROM 'C:\Users\federica.giuliani\OneDrive - Horsa spa\Desktop\Microsoft and Data Platform\datasets_dwh_projects\source_erp\PX_CAT_G1V2.csv'
WITH(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);
END
