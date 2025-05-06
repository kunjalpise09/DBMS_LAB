-- Aggregate Functions

-- 1. Count the number of customers:
SELECT COUNT(*) AS total_customers FROM CUSTOMER;

-- 2. Find the average age of customers:
SELECT AVG(age) AS average_age FROM CUSTOMER;

-- 3. Find the maximum cost of a hotel room:
SELECT MAX(cost_hotel) AS max_hotel_cost FROM HOTEL;

-- 4. Find the minimum cost of a ticket:
SELECT MIN(cost_ticket) AS min_ticket_cost FROM TICKETS;

-- 5. Calculate the sum of cost of all tickets for TRIP ID 401
SELECT SUM(cost_ticket) AS total_ticket_cost FROM TICKETS WHERE ID_TRIP = 401;



-- Numeric Functions

-- 1. Round the average hotel cost to the nearest integer:
SELECT ROUND(AVG(cost_hotel), 0) AS rounded_avg_hotel_cost FROM HOTEL;

-- 2. Calculate the absolute value of cost_hotel - 100:
SELECT ABS(cost_hotel - 100) AS cost_difference FROM HOTEL;

--3. show the remainder when the ticket cost is divided by 100
SELECT MOD(cost_ticket, 100) AS cost_remainder from TICKETS;

--4. Truncate the cost of the hotel room to the integer part
SELECT TRUNC(cost_hotel, 0) from HOTEL;

--5. Calculate the square root of the hotel cost
SELECT SQRT(cost_hotel) from HOTEL;



-- Date Functions

-- 1. Show the current date:
SELECT SYSDATE FROM DUAL;

-- 2. Show the end date of the passport plus 30 days
SELECT id_passport, date_end_passport, date_end_passport + 30 AS new_end_date 
FROM CUSTOMER;

-- 3. Calculate the number of days between today and the trip date:
SELECT ID_TRIP, DATE_TRIP, SYSDATE, DATE_TRIP - SYSDATE AS days_until_trip 
FROM TRIP;

-- 4. Extract the year from the date_end_passport:
SELECT id_passport, date_end_passport, EXTRACT(YEAR FROM date_end_passport) AS passport_end_year 
FROM CUSTOMER;

-- 5. show the last day of the month for the trip date.
SELECT ID_TRIP, DATE_TRIP, LAST_DAY(DATE_TRIP) AS last_day_of_month
FROM TRIP;



-- String Functions

-- 1. Concatenate the first and last names of employees:
SELECT ID, FNAME || ' ' || LNAME AS full_name FROM EMPLOYEE;

-- 2. Convert customer name to uppercase:
SELECT id_passport, UPPER(name) AS upper_case_name FROM CUSTOMER;

-- 3. Get the length of the customer name
SELECT id_passport, LENGTH(name) AS name_length from CUSTOMER;

-- 4. Extract the first 3 characters of the hotel name
SELECT id_hotel, SUBSTR(name_hotel, 1, 3) AS short_name from HOTEL;

-- 5. Remove trailing spaces from the country_of_starting
SELECT id_tickets, country_of_starting, RTRIM(country_of_starting) AS trimmed_country from TICKETS;



-- Conversion Functions

-- 1. Convert the age of the customer to a VARCHAR2:
SELECT id_passport, age, TO_CHAR(age) AS age_as_string FROM CUSTOMER;

-- 2. Convert the string '2024-08-01' to a DATE:
SELECT TO_DATE('2024-08-01', 'YYYY-MM-DD') AS converted_date FROM DUAL;

-- 3.  Convert cost_ticket to a string with a dollar sign
SELECT id_tickets, cost_ticket, TO_CHAR(cost_ticket, 'L9999.99') AS formatted_cost from TICKETS;

-- 4. Convert a string to a number
SELECT TO_NUMBER('12345') AS converted_number FROM DUAL;

-- 5. Convert a date to a string in a specific format
SELECT DATE_TRIP, TO_CHAR(DATE_TRIP, 'Month DD, YYYY') AS formatted_date
FROM TRIP;
