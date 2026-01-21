IF OBJECT_ID ('bronze.crm_cust_info' , 'U') IS NOT NULL
DROP TABLE bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info(
cst_id INT,
cts_key NVARCHAR(50),
cts_firstname NVARCHAR(50),
cts_lastname NVARCHAR(50),
cts_material_status NVARCHAR(50),
cts_gndr NVARCHAR(50),
cts_create_date DATE
);

IF OBJECT_ID ('bronze.crm_prod_info' , 'U') IS NOT NULL
DROP TABLE bronze.crm_prod_info;
CREATE TABLE bronze.crm_prod_info(
prd_id INT,
prd_key NVARCHAR(50),
prd_nm NVARCHAR(50),
prd_cost INT,
prd_line NVARCHAR(50),
prd_start_dt NVARCHAR(10),
prd_end_dt NVARCHAR(10)
);

IF OBJECT_ID ('bronze.crm_sales_details' , 'U') IS NOT NULL
DROP TABLE bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details(
sls_ord_num NVARCHAR(50),
sls_prd_key NVARCHAR(50),
sls_cust_id INT,
sls_order_dt INT,
sls_ship_dt INT,
sls_due_dt INT,
sls_sales INT,
sls_quantity INT,
sls_price INT
);

IF OBJECT_ID ('bronze.erp_cust' , 'U') IS NOT NULL
DROP TABLE bronze.erp_cust;
CREATE TABLE bronze.erp_cust(
cid NVARCHAR(50),
bdate DATE,
gen NVARCHAR(50)
);

IF OBJECT_ID ('bronze.erp_loc' , 'U') IS NOT NULL
DROP TABLE bronze.erp_loc;
CREATE TABLE bronze.erp_loc(
cid NVARCHAR(50),
cntry NVARCHAR(50)
);

IF OBJECT_ID ('bronze.erp_price_cat' , 'U') IS NOT NULL
DROP TABLE bronze.erp_price_cat;
CREATE TABLE bronze.erp_price_cat(
id NVARCHAR(50),
cat NVARCHAR(50),
subcat NVARCHAR(50),
maintenance NVARCHAR(50)
);



  
