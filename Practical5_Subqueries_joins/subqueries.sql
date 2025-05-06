-- Subqueries

-- 1. Find customers who have made a reservation with employee 'John Doe':
SELECT id_passport, name
FROM CUSTOMER
WHERE id_passport IN (SELECT id_passport FROM RESERVATION WHERE ID = (SELECT ID FROM EMPLOYEE WHERE FNAME = 'John' AND LNAME = 'Doe'));

-- 2. Find hotels that have a cost higher than the average hotel cost:
SELECT id_hotel, name_hotel, cost_hotel
FROM HOTEL
WHERE cost_hotel > (SELECT AVG(cost_hotel) FROM HOTEL);

-- 3. Find trips that have tickets with a cost greater than 500:
SELECT ID_TRIP, DATE_TRIP, TYPE
FROM TRIP
WHERE ID_TRIP IN (SELECT ID_TRIP FROM TICKETS WHERE cost_ticket > 500);
