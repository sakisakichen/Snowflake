-- choose role: accountadmin 
--------------------------------------------------------------------------------------------------
--Step1: CREATE DATABASE, SCHEMA, TABLE 
 CREATE OR REPLACE TABLE CUSTOMERS (
  id int autoincrement start 1 increment 1 NOT NULL,
  Name varchar(255),
  Phone varchar(100),
  Email varchar(255),
  Address varchar(255),
  PostalZip varchar(50),
  Region varchar(50),
  Country varchar(100),
  Company varchar(255),
  LastTransaction varchar(255),
  DoB varchar(255)
);

--------------------------------------------------------------------------------------------------

--Step2: insert data into Customers table manually 
INSERT INTO CUSTOMERS (name,phone,email,address,postalZip,region,country,Company,LastTransaction,DoB)
VALUES
  ('   Kline, Alisa T.','00448454643','tempor.bibendum@yahoo.ca','Ap #671-8278 Nec St.','8386-3377','Pernambuco','United Kingdom','','2022-09-21 23:00:00','February 10, 1996'),
  (' Whitney, Kaitlin T.','+481513245743','sapien@yahoo.org','Ap #972-5338 Dignissim. Rd.','65-168','Santa Catarina','Poland',NULL,'2022-03-15 22:11:00','January 23, 1969'),
  ('Curtis, Anthony T.   ','+448001111','ut.ipsum@yahoo.net','490-7128 Nunc. Av.','281132','Guanacaste','United Kingdom','Nullam Scelerisque Company',Concat(TO_VARCHAR(current_date()),' 01:04:15'),'June 22, 1975'),
  ('000Bennett, Nasim Z.','+47169772165','elementum.sem@hotmail.org','Ap #138-7239 Integer St.','4114 DC','Mexico City','Norway','Cursus Diam At Ltd','2021-12-21 09:00:00','October 21, 1951'),
  ('Brock, Alec N.','00551366269750','enim.nunc.ut@yahoo.couk','597-548 Egestas. Rd.','2892','Vorarlberg','Brazil','Nec Ante Blandit Company','2022-10-01 12:21:00','December 30, 1999'),
  ('Golden, Lane H.','00638811661136','lacus.varius@outlook.net','518-7417 Arcu Av.','82454','San José','Philippines','Risus Associates','2022-10-01 09:44:00','September 12, 1970'),
  ('Mayer, Dominique V.','0063171546824','ipsum.phasellus@aol.edu','P.O. Box 443, 6497 Elementum, Rd.','374482','Kaluga Oblast','China','Iaculis Quis Corporation','2022-09-01 18:10:00','November 27, 1997'),
  ('Whitfield, Len F.','00521375483625','quisque.fringilla@protonmail.org','Ap #246-753 Arcu. Avenue','Y2L 5R6','Akwa Ibom','Mexico','Nec Ante Institute','2022-10-12 13:11:00','July 19, 1975'),
  ('Hyde, Angelica E.','+445508611528','odio.aliquam@hotmail.edu','Ap #671-6622 Feugiat Road','1898-8474','Hatay','United Kingdom','Magna Limited','2022-06-19 13:11:00','January 31, 1951'),
  ('Alford, Reece S.','+903069949880','vel@outlook.edu','P.O. Box 427, 691 Vel Av.','43021','Sumy oblast','Turkey','Amet Corporation','2022-07-18 13:11:00','October 20, 1967'),
  ('Huber, Nora Y.','00481515895743','noray32@yahoo.org','Ap 10 Dignissim. Rd.','65-168','Santa Catarina','Poland','LETNI','2022-05-29 23:50:00','December 23, 1999'),
  ('Tate, Rosalyn G.','+18454642','dui.semper@aol.co.uk','P.O. Box 717, 486 Sed St.','17580','Gangwon','United States','Mauris Vel Associates',Concat(TO_VARCHAR(current_date()),' 00:44:00'),'September 25, 1959'),
  ('T, Rosalyn G.','+18454642','dui.semper@aol.co.uk','P.O. Box 717, 486 Sed St.','17580','Gangwon','United States','Mauris Vel Associates','2022-11-11 13:11:00','September 25, 1959'),
  ('Kirby, Shea Y.','00317021434131','erat.eget@outlook.edu','722-6870 Amet Road','861952','Aragón','Netherlands','Semper Rutrum Fusce Consulting',Concat(TO_VARCHAR(current_date()),' 00:55:45'),'December 10, 1955'),
  ('Kirbi, Shea Y.','','erat.eget@outlook.edu','722-6870 Amet Road','861952','Aragón','Netherlands','Semper Rutrum Fusce Consulting','2022-12-01 13:11:00','December 10, 1955'),
  ('K, Shea Y.','00317021434131','erat.eget@outlook.edu','722-6870 Amet Road','861952','Aragón','Netherlands','Semper Rutrum Fusce Consulting','2020-04-18 13:11:00','December 10, 1955'),
  (Null,'',Null,'722-6870 Amet Road','091952','Aragón','Netherlands','Semper Rutrum Fusce Consulting',Concat(TO_VARCHAR(current_date()),' 00:23:45'),'December 10, 1955'),
  ('Booker, Bradley R. ','00448001111','','490-7128 Nunc. Av.','281132','Guanacaste','United Kingdom','Nullam Scelerisque Company','2022-11-01 13:11:00','June 22, 1975'),
  (Null,Null,Null,'Ap #972-5338 Dignissim. Rd.','65-168','Santa Catarina','Poland','Aptent Taciti PC','2022-12-15 13:11:00','January 23, 1969'),
  ('Sandoval, Quinlan Z.','0015567878637','ut@protonmail.edu','166-7842 Eget Road','537423','Huádōng','United States','Suspendisse Foundation','2022-10-12 01:58:45','May 14, 2000'),
  ('Small, Gil U.','00317042618694','id.risus@google.ca','906-9695 Velit. Street','36362','Emilia-Romagna','Netherlands','Aliquam Gravida Associates','2022-09-22 19:29:58','March 17, 1994'),
 ('Kirby, Cameron D.','001800473297','nunc@hotmail.com','5034 Lacus. Rd.','95804','Khyber Pakhtoonkhwa','United States','Suspendisse Foundation','2022-10-22 17:02:07','December 1, 1989')
  ;

SELECT * FROM Customers limit 3;

-----------------------------------------------------------------------------------------------------

--Step 3: Write a Select * statement to print the dataset, then Investigate data quality issues.

---Step 3-1: extra spaces in the Name column
SELECT name , concat('>',name,'<')
FROM Customers;

select name, trim(name,' 0') as n 
FROM customers;

SELECT name, split_part(trim(name,'0 '),',',1) as first_name, split_part(trim(name,'0 '),',',2) as last_name
FROM customers;

---Step 3-2: phone column with +/0 and space 
SELECT phone ,trim(phone,' 0+') as phone_number
FROM customers;

---Step 3-3: null values in company /email column

---Step 3-4: data type not matched 
SELECT DOB FROM Customers;
SELECT to_date(DOB,'MMMM DD, YYYY'), to_DATE(LASTTRANSACTION,'AUTO')
FROM Customers;


-----------------------------------------------------------------------------------------------------
--Step 4: Add new computed column “Days Since Last Transaction” 
https://docs.snowflake.com/en/sql-reference/functions/datediff

SELECT to_DATE(LASTTRANSACTION,'AUTO'),
DATEDIFF(days, to_DATE(LASTTRANSACTION,'AUTO'),current_date()) AS DaysSinceLastTrans
FROM CUSTOMERS;

-----------------------------------------------------------------------------------------------------
--Step 5: Using the DaysSinceLastTransaction column Query the DataSet to find the list of Inactive Customers (DaysSinceLastTransaction>90)

SELECT 
    ID, 
	SPLIT_PART(TRIM(NAME,' 0'),', ', 1) as FIRST_NAME, 
    SPLIT_PART(TRIM(NAME,' 0'),', ', 2) as LAST_NAME, 
    EMAIL,
    TO_DATE(DOB,'MMMM DD, YYYY') DOB,
	TO_DATE(LastTransaction,'AUTO') AS LastTransaction,
	DATEDIFF(days, TO_DATE(LastTransaction,'AUTO'), current_date()) as DaysSinceLastTrans,
    LTRIM(PHONE,'0+') as Standarized_Phone,
    ADDRESS, 
    REGION , 
    COUNTRY,
    COMPANY
FROM
    CUSTOMERS
 WHERE DaysSinceLastTrans > 90;

-----------------------------------------------------------------------------------------------------
--Step 6: Deal with missing values in the company /email column

SELECT * FROM customers where email is null or email = '';
SELECT * FROM customers where not (email is null or email = '');

https://docs.snowflake.com/en/sql-reference/functions/iff

SELECT company,
IFF(company is null or company = '','NA',company) as clean_company
from customers;

-----------------------------------------------------------------------------------------------------
--Step 7: Eliminate Duplications, keep the latest transaction record data

SELECT EMAIL,count(*)
FROM Customers
GROUP BY 1
HAVING COUNT(*) > 1;

SELECT ID, NAME, EMAIL, TO_DATE(LastTransaction,'AUTO') AS LastTransaction,
rank()over(partition by email order by TO_DATE(LastTransaction,'AUTO') DESC) as rnk 
FROM Customers
;

--Note :In a SELECT statement, the QUALIFY clause filters the results of window functions
https://docs.snowflake.com/en/sql-reference/constructs/qualify

SELECT ID, NAME, EMAIL, TO_DATE(LastTransaction,'AUTO') AS LastTransaction,
rank()over(partition by email order by TO_DATE(LastTransaction,'AUTO') DESC) as rnk 
FROM Customers
QUALIFY rnk = 1;


-----------------------------------------------------------------------------------------------------
--Step 8: filter the data and stored as view table :

CREATE OR REPLACE VIEW customers_VW as (
WITH CTE as (
SELECT 
ID, Name, Email, LastTransaction,
rank() over (partition by email order by TO_DATE(LastTransaction,'AUTO') desc) RANK 
from CUSTOMERS QUALIFY RANK =1
)
SELECT 
    ID, 
	SPLIT_PART(TRIM(NAME,' 0'),',',1) AS FIRST_NAME, 
    SPLIT_PART(TRIM(NAME,' 0'),', ',2) AS LAST_NAME, 
    EMAIL,
    TO_DATE(DoB, 'MMMM DD, YYYY' ) as DoB,
    DATEDIFF(year, TO_DATE(DoB, 'MMMM DD, YYYY' ), current_date()) as AGE,
	TO_DATE(LastTransaction,'AUTO') AS LastTransaction,
    DATEDIFF(days, LastTransaction, current_date()) as DaysSinceLastTrans,
    iff(((COMPANY IS NULL) OR (COMPANY = '') ),'N/A', COMPANY) AS COMPANY,
	LTRIM(PHONE, '+0' ) AS PHONE,
	ADDRESS, postalZip, Region , COUNTRY
FROM
    CUSTOMERS
WHERE 
    NOT(email is null OR email='') AND ID in (select ID from CTE)
    );

SELECT * FROM customers_VW where DaysSinceLastTrans > 90;


  
-----------------------------------------------------------------------------------------------------
--Step 9: Extract the result as CSV. :