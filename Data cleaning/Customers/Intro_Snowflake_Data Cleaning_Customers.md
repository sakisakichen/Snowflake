# Customers Data in Snowflake database 

### reformat and clean data using SQL functions In Snowflake, fIND THE LIST OF inactive customer data which is no transaction record over 90 days  


### Data Sources:
This data contains 1 table : customers  
with ID, name, phone, email, address, country, company, last transaction , and date of birth information

### Tools
- Snowflake SQL


### Project Steps
Step 1 : Create database,schema  \
Step 2 : Create table and insert into values \
Step 3 : Investigate data quality issues\
Step 4 : Find the list of Inactive Customers (DaysSinceLastTransaction>90)\
Step 5 : Extract the outcome as CSV file  


### Insight gained 
Familiar with database, schema, table creation in Snowflake UI. 
Data Quality check and cleaning ( data type, Split_part column, trim extra space, Datediff ), miss value(If null or empty ) to get the expected result.



