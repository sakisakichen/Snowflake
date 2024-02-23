# 2023 Dec US House prices analysis on Snowflake and visualization on Tableau
### The project focused on analyzing US houses price on Snowflake and connecting to Tableau to present visualization. 



### Data Sources:
#### data source :US Housing Data 
A dataset comprising various variables around housing and demographics for the top 50 American cities by population.
##### <https://www.kaggle.com/datasets/jeremylarcher/american-house-prices-and-demographics-of-top-cities/data>


##### Data Variables:
Zip Code: Zip code within which the listing is present.\
Price: Listed price for the property.\
Beds: Number of beds mentioned in the listing.\
Baths: Number of baths mentioned in the listing.\
Living Space: The total size of the living space, in square feet, mentioned in the listing.\
Address: Street address of the listing.\
City: City name where the listing is located.\
State: State name where the listing is located.\
Zip Code Population: The estimated number of individuals within the zip code. Data from Simplemaps.com.\
Zip Code Density: The estimated number of individuals per square mile within the zip code. Data from Simplemaps.com.\
County: County where the listing is located.\
Median Household income: Estimated median household income. Data from the U.S. Census Bureau.\
Latitude: Latitude of the zip code. ** Data from Simplemaps.com.\
Longitude: Longitude of the zip code. Data from Simplemaps.com.\


### Tools
- Snowflake
- Tableau (connecting to Snowflake database)


### Snowflake Query 
1. Retrieve the average price of properties listed in each city.
2. Calculate the total number of beds and baths available across all listings.
3. Find the minimum and maximum living space available among all listings.
4. List the top 5 most populous zip codes along with their corresponding population.
5. Determine the average household income in each state.
6. Count the number of listings in each county.
7. Calculate the median price of properties in zip codes with a population density above a certain threshold.
8. Find the average price of properties in zip codes with a median household income above a certain amount.
9. Identify the city with the highest number of listings.



### Visualization Output on Tableau

1. Top 5 city of house price in each state
2. Median Household Income in Each State
3. Number of Listing of Each City
4. Dashboard contains #1-3
##### <https://public.tableau.com/views/2023DecUSHousePrice/2023DecUSHousePrice?:language=en-US&publish=yes&:sid=&:display_count=n&:origin=viz_share_link> 



### References 

##### Data Sources
https://simplemaps.com/data/us-zips
https://data.census.gov/profile/United_States?g=010XX00US


##### Connect with tableau to snowflake data source
https://www.youtube.com/watch?v=Nt_S-Ac3PE4


