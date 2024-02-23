-- choose role: accountadmin 
--------------------------------------------------------------------------------------------------
-- Step1: CREATE DATABASE, SCHEMA, TABLE 
USE database UShouse;
USE schema public;

CREATE OR REPLACE TABLE us_housing(
ZipCode INT ,
Price INT ,
Beds INT ,
Baths INT ,
LivingSpace INT ,
Address varchar(50),
City varchar(50),
State varchar(50),
ZipCodePopulation INT ,
ZipCodeDensity FLOAT,
County varchar(50),
MedianHouseholdincome INT,
Latitude varchar(50),
Longitude varchar(50)
);

SELECT * FROM US_housing;

-----------------------------------------------------------------------
-- Step 2 Load the data by uploading CSV file 

SELECT * FROM US_housing LIMIT 3;

-----------------------------------------------------------------------
-- Step 3 Check Data quality 
--- Data type 
SELECT TO_DECIMAL(price) as price
FROM  US_housing;

SELECT concat('>',trim(address),'<') as adress from US_housing;

SELECT longitude,SPLIT_PART(longitude,'-',2) as adjusted_longitude
FROM US_housing;

-----------------------------------------------------------------------
-- Step 4 SQL Query 
--Q1  Retrieve the average price of properties listed in each city.
SELECT state,city, AVG(PRICE) AS AVG_PRICE
FROM US_housing
GROUP BY state,city
ORDER BY AVG_PRICE DESC ; 
--Q1-1 list the top 5 city of each state order by avergae price 
select * from (
SELECT state, city, avg(price) as avg_price, rank()over(partition by state order by avg(price) DESC) as city_order
FROM us_housing GROUP BY state,city
)t where city_order <= 5 order by avg_price DESC;

--Q2 Calculate the total number of beds and baths available across all listings.
SELECT distinct beds, baths from us_housing order by (1,2) DESC;

--Q3 Find the minimum and maximum living space available among all listings.
SELECT min(livingspace) as min_livingspace FROM us_housing;
SELECT max(livingspace) as max_livingspace FROM us_housing;

--Q4 List the top 5 most populous zip codes along with their corresponding population.

SELECT distinct zipcode, zipCODEpopulation
FROM US_housing
ORDER BY zipcodepopulation DESC 
LIMIT 5;
--Q4-1 list down the top 5 most populated city of each state 

WITH cte  AS (
    SELECT 
        City,
        State,
        ZipCode,
        ZipCodePopulation,
        dense_rank() OVER (PARTITION BY State ORDER BY ZipCodePopulation DESC) AS Rank
    FROM 
        US_housing 
)
SELECT 
    City,
    State,
    ZipCode,
    ZipCodePopulation
FROM 
    cte
WHERE 
    Rank <= 5 and state = 'California'
    ORDER BY ZipCodePopulation DESC;


--Q5 Determine the average household income in each state.
SELECT state,median(medianhouseholdincome) as AVG_householdincom
FROM us_housing
GROUP BY state
ORDER BY AVG_householdincom DESC;

--Q6 Count the number of listings in each county.
SELECT county,count(*) as cnt
FROM US_housing
GROUP BY 1
order by cnt DESC;

--Q7 Calculate the median price of properties in zip codes with a population density above a certain threshold.
SELECT ZipCode, MEDIAN(Price) AS Median_Price
FROM US_housing
WHERE Zip_Code_Density > threshold
GROUP BY ZipCode;

--Q8 Find the average price of properties in zip codes with a median household income above a certain amount.
SELECT ZipCode, AVG(medianhouseholdincome) as AVG_householdincom
FROM US_housing
WHERE medianhouseholdincome > threshold
GROUP BY ZipCode;

--Q9 Identify the city with the highest number of listings.
SELECT city
FROM us_housing
GROUP BY city
ORDER BY COUNT(*) DESC 
LIMIT 1;
