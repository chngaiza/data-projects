CREATE DATABASE auto_dealer;

CREATE TABLE cars ( 
	id INTEGER PRIMARY KEY NOT NULL,
	make VARCHAR(20) NOT NULL,
	model VARCHAR(20) NOT NULL,
	year NUMERIC NOT NULL,
	date_of_puchase DATE NOT NULL, 
	sell_price NUMERIC NOT NULL,
	listed_price NUMERIC NOT NULL,
	dealership_id INTEGER NOT NULL REFERENCES dealerships(id)
); 

CREATE TABLE sold_cars (
	id INTEGER PRIMARY KEY NOT NULL,
	sale_price NUMERIC NOT NULL, 
	date_sold DATE NOT NULL, 
	employee_id INTEGER NOT NULL REFERENCES employees(id),
	cars_id INTEGER NOT NULL REFERENCES cars(id),
	customer_id INTEGER NOT NULL REFERENCES customer(id)
);

CREATE TABLE employees (
	id INTEGER PRIMARY KEY NOT NULL,
	first_name VARCHAR(50) NOT NULL, 
	last_name VARCHAR(50) NOT NULL, 
	cars_id INTEGER NOT NULL REFERENCES cars(id), 
	dealership_id INTEGER NOT NULL REFERENCES dealerships(id) 
	
); 

CREATE TABLE customers (
	id INTEGER PRIMARY KEY NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL, 
	phone_number VARCHAR(11),
	email VARCHAR(100),
	cars_id INTEGER NOT NULL REFERENCES cars(id),
	employee_id INTEGER NOT NULL REFERENCES employees(id)
);

CREATE TABLE dealerships (
	id INTEGER PRIMARY KEY NOT NULL,
	location_name VARCHAR(50) NOT NULL
);
	


