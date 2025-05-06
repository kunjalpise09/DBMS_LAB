-- Joins

-- 1. Show customer names along with their reservation IDs:
SELECT c.name, r.reservation_id
FROM CUSTOMER c
JOIN RESERVATION r ON c.id_passport = r.id_passport;

-- 2. Show employee names and the services they are involved in:
SELECT e.FNAME, e.LNAME, r.reservation_id
FROM EMPLOYEE e
JOIN RESERVATION r ON e.ID = r.ID;

-- 3. Show Hotel Name and the cost of the most expensive room in that hotel.
SELECT h.name_hotel, MAX(t.cost_ticket) AS Max_Ticket_Cost
FROM HOTEL h
JOIN TICKETS t ON h.id_hotel = t.ID_TRIP
GROUP BY h.name_hotel;

-- 4. LEFT JOIN: Show all customers and their reservation IDs, even if they haven't made a reservation:
SELECT c.name, r.reservation_id
FROM CUSTOMER c
LEFT JOIN RESERVATION r ON c.id_passport = r.id_passport;

-- 5. RIGHT JOIN: Show all reservations and the customer names, even if the customer info is not available
SELECT c.name, r.reservation_id
FROM CUSTOMER c
RIGHT JOIN RESERVATION r ON c.id_passport = r.id_passport;

-- 6. FULL OUTER JOIN: Show all customers and all reservations, regardless of whether there's a match:
SELECT c.name, r.reservation_id
FROM CUSTOMER c
FULL OUTER JOIN RESERVATION r ON c.id_passport = r.id_passport;

-- 7.  JOIN with a WHERE clause: Show the names of customers who have reservations made by employee 'John Doe':
SELECT c.name, r.reservation_id
FROM CUSTOMER c
JOIN RESERVATION r ON c.id_passport = r.id_passport
WHERE r.ID = (SELECT ID FROM EMPLOYEE WHERE FNAME = 'John' AND LNAME = 'Doe');

-- 8. JOIN with aggregation: Show the number of reservations made by each employee:
SELECT e.FNAME, e.LNAME, COUNT(r.reservation_id) AS num_reservations
FROM EMPLOYEE e
JOIN RESERVATION r ON e.ID = r.ID
GROUP BY e.FNAME, e.LNAME;

-- 9. JOIN with ORDER BY: Show customer names and their reservation IDs, ordered by customer name:
SELECT c.name, r.reservation_id
FROM CUSTOMER c
JOIN RESERVATION r ON c.id_passport = r.id_passport
ORDER BY c.name;

-- 10. Join multiple tables: Show customer name, reservation id, and the employee first name for each reservation:
SELECT c.name, r.reservation_id, e.FNAME
FROM CUSTOMER c
JOIN RESERVATION r ON c.id_passport = r.id_passport
JOIN EMPLOYEE e ON r.ID = e.ID;

-- 11.  Self Join:  Show pairs of employees who have the same last name.
SELECT e1.FNAME AS Employee1_FirstName, e1.LNAME AS Employee1_LastName, e2.FNAME AS Employee2_FirstName, e2.LNAME AS Employee2_LastName
FROM EMPLOYEE e1
JOIN EMPLOYEE e2 ON e1.LNAME = e2.LNAME
WHERE e1.ID <> e2.ID;  -- Exclude matching the same employee.

-- 12. Join with a Subquery in the ON Clause: Show hotels that are located in countries where tickets are sold.
SELECT h.name_hotel
FROM HOTEL h
JOIN TICKETS t ON h.id_hotel = t.ID_TRIP
AND t.country_of_starting IN (SELECT DISTINCT country_of_starting FROM TICKETS);
