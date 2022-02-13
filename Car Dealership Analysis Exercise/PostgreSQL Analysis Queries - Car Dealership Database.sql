
1.	List the locations and number of cars sold in the last year.

SELECT dealerships.location_name, COUNT(sold_cars.id) AS cars_sold_2021
FROM dealerships, sold_cars, cars
WHERE cars.id = sold_cars.id
AND dealerships.id = cars.dealership_id
AND sold_cars.date_sold BETWEEN '01-01-2021' AND '12-31-2021'
GROUP BY dealerships.location_name;

2.	Which location is the most profitable in the last year (sell price - purchase price)?

SELECT dealerships.location_name, SUM(sold_cars.sale_price) AS gross_sale
FROM dealerships, sold_cars, cars 
WHERE cars.id = sold_cars.id
AND dealerships.id = cars.dealership_id
GROUP BY dealerships.location_name;

3.	How many 2020 cars have we sold in the last year?

SELECT cars.year, COUNT(cars.id) AS total_cars
FROM cars, sold_cars
WHERE cars.id = sold_cars.id 
AND sold_cars.date_sold BETWEEN '01-01-2021' AND '12-31-2021'
AND cars.year = '2020'
GROUP BY cars.year; 

4.	Do we have any repeat customers?

SELECT id, first_name, last_name
FROM customers
GROUP BY id, first_name, last_name
ORDER BY id;

5.	What make of car is the best-selling?

SELECT cars.make, sold_cars.sale_price
FROM cars, sold_cars
INNER JOIN sold_cars ON cars.id = sold_cars.id
GROUP BY cars.make
ORDER BY sold_cars.sale_price DESC; 

6.	How many cars does each location currently have available?

SELECT dealerships.location_name, COUNT(cars.id) AS total_cars
FROM dealerships
INNER JOIN cars ON dealerships.id = cars.dealership_id
GROUP BY dealerships.location_name
ORDER BY COUNT(cars.id) DESC;
