-- Create database & schema

-- ----create an integration object that contains the access information
CREATE OR REPLACE STORAGE INTEGRATION azure_snowpipe_integration
type = external_stage
storage_provider = AZURE
enabled = true 
azure_tenant_id = 'dc3414a4-225c-4f6f-9142-014dec12ca6a'
storage_allowed_locations = ('azure://snowflakeaccount02.blob.core.windows.net/container01');


--Describe integration object to provide access
DESC integration azure_snowpipe_integration;

--Get Azure Consent URL information 

--create file format object 
CREATE OR REPLACE file format fileformat_azure
type = 'csv'
field_delimiter = ','
skip_header = 1;

-- Create Stage Object with Integration object 
CREATE OR REPLACE STAGE azure_sample.public.stg_azure_cont
URL = 'azure://snowflakeaccount02.blob.core.windows.net/container01'
STORAGE_INTEGRATION = azure_snowpipe_integration
FILE_FORMAT = fileformat_azure;

-- Listing files under the azure containers
list @azure_sample.public.stg_azure_cont;


--CREATE TABLE 
create or replace TABLE AZURE_SAMPLE.PUBLIC.SAMPLE_DATA_AZURE (
	ORDER_ID VARCHAR(255),
	ORDER_ITEM_ID NUMBER(38,0),
	PRODUCT_ID VARCHAR(255),
	SELLER_ID VARCHAR(255),
	SHIPPING_LIMIT_DATE DATE,
	PRICE NUMBER(38,0),
	FREIGHT_VALUE NUMBER(38,0)
);

------- USE COPY Command to load the files
COPY INTO AZURE_SAMPLE.PUBLIC.SAMPLE_DATA_AZURE
FROM @azure_sample.public.stg_azure_cont
File_format = fileformat_azure
ON_ERROR = CONTINUE;


-- Check Data---
SELECT * FROM SAMPLE_DATA_AZURE limit 3;



