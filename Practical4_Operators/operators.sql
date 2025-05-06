-- Logical Operators: AND, OR, NOT
-- 1. Find customers who are older than 30 and whose passport expires after '2026-01-01':
SELECT id_passport, name, age, date_end_passport
FROM CUSTOMER
WHERE age > 30 AND date_end_passport > TO_DATE('2026-01-01', 'YYYY-MM-DD');

-- 2. Find employees with the first name 'John' or last name 'Smith':
SELECT ID, FNAME, LNAME
FROM EMPLOYEE
WHERE FNAME = 'John' OR LNAME = 'Smith';

-- 3. Find services that are not 'Flight Booking':
SELECT service_id, service_name, description
FROM SERVICE
WHERE NOT service_name = 'Flight Booking';


-- LIKE Operator
-- 1. Find hotels whose names start with 'L':
SELECT id_hotel, name_hotel
FROM HOTEL
WHERE name_hotel LIKE 'L%';

-- 2. Find customers whose names contain 'a':
SELECT id_passport, name
FROM CUSTOMER
WHERE name LIKE '%a%';

-- 3. Find employees whose last name has exactly 5 characters
SELECT ID, FNAME, LNAME
FROM EMPLOYEE
WHERE LENGTH(LNAME) = 5;


-- BETWEEN Operator
-- 1. Find hotels with a cost between 100 and 200:
SELECT id_hotel, name_hotel, cost_hotel
FROM HOTEL
WHERE cost_hotel BETWEEN 100 AND 200;

-- 2. Find trips that start between '2024-07-01' and '2024-09-30':
SELECT ID_TRIP, DATE_TRIP, TYPE
FROM TRIP
WHERE DATE_TRIP BETWEEN TO_DATE('2024-07-01', 'YYYY-MM-DD') AND TO_DATE('2024-09-30', 'YYYY-MM-DD');


-- IN Operator

-- 1. Find trips of type 'Adventure', 'Cultural', or 'Historical':
SELECT ID_TRIP, DATE_TRIP, TYPE
FROM TRIP
WHERE TYPE IN ('Adventure', 'Cultural', 'Historical');

-- 2. Find customers with passport IDs 'A123456', or 'C345678':
SELECT id_passport, name
FROM CUSTOMER
WHERE id_passport IN ('A123456', 'C345678');

-- 3. Find Hotels with id_hotel 601, 605, or 608
SELECT id_hotel, name_hotel
FROM HOTEL
WHERE id_hotel IN (601, 605, 608);
