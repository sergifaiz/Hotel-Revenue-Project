WITH hotels as (
SELECT * FROM dbo.['2018$']
UNION
SELECT * FROM dbo.['2019$']
UNION							/*3 years tables are unified using UNION*/
SELECT * FROM dbo.['2020$'])

/*SELECT							/*What is our revenue?*/
arrival_date_year,
hotel,
ROUND(SUM((stays_in_week_nights + stays_in_weekend_nights) * adr),2) AS revenue 
FROM hotels	
GROUP BY arrival_date_year, hotel

SELECT * FROM dbo.market_segment$	*/					/*dbo.market segments - discount offered by type*/
														/*meal_cost- cost of the meal*/

															/*(INNER) JOIN: Returns records that have matching values in both tables
															LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table
															RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table
															FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table*/
SELECT * FROM hotels									
LEFT JOIN dbo.market_segment$
ON hotels.market_segment = market_segment$.market_segment 
LEFT JOIN dbo.meal_cost$
ON meal_cost$.meal = hotels.meal


