-- CUSTOMER Table
CREATE TABLE CUSTOMER (
    id_passport VARCHAR2(20) PRIMARY KEY,
    phone_number VARCHAR2(20),
    date_end_passport DATE,
    name VARCHAR2(100),
    age NUMBER
);

INSERT INTO CUSTOMER (id_passport, phone_number, date_end_passport, name, age) VALUES
('A123456', '123-456-7890', TO_DATE('2025-12-31', 'YYYY-MM-DD'), 'Alice Wonderland', 30);

INSERT INTO CUSTOMER (id_passport, phone_number, date_end_passport, name, age) VALUES
('B234567', '234-567-8901', TO_DATE('2026-01-15', 'YYYY-MM-DD'), 'Bob The Builder', 45);

INSERT INTO CUSTOMER (id_passport, phone_number, date_end_passport, name, age) VALUES
('C345678', '345-678-9012', TO_DATE('2025-11-20', 'YYYY-MM-DD'), 'Charlie Chaplin', 60);

INSERT INTO CUSTOMER (id_passport, phone_number, date_end_passport, name, age) VALUES
('D456789', '456-789-0123', TO_DATE('2026-02-28', 'YYYY-MM-DD'), 'Diana Prince', 28);

INSERT INTO CUSTOMER (id_passport, phone_number, date_end_passport, name, age) VALUES
('E567890', '567-890-1234', TO_DATE('2027-03-31', 'YYYY-MM-DD'), 'Ethan Hunt', 35);

INSERT INTO CUSTOMER (id_passport, phone_number, date_end_passport, name, age) VALUES
('F678901', '678-901-2345', TO_DATE('2026-10-30', 'YYYY-MM-DD'), 'Fiona Goode', 50);

-- EMPLOYEE Table
CREATE TABLE EMPLOYEE (
    ID NUMBER PRIMARY KEY,
    LNAME VARCHAR2(50),
    FNAME VARCHAR2(50)
);

INSERT INTO EMPLOYEE (ID, LNAME, FNAME) VALUES
(101, 'Doe', 'John');

INSERT INTO EMPLOYEE (ID, LNAME, FNAME) VALUES
(102, 'Smith', 'Jane');

INSERT INTO EMPLOYEE (ID, LNAME, FNAME) VALUES
(103, 'Williams', 'David');

INSERT INTO EMPLOYEE (ID, LNAME, FNAME) VALUES
(104, 'Brown', 'Emily');

INSERT INTO EMPLOYEE (ID, LNAME, FNAME) VALUES
(105, 'Davis', 'Michael');

INSERT INTO EMPLOYEE (ID, LNAME, FNAME) VALUES
(106, 'Wilson', 'Sarah');

-- SERVICE Table
CREATE TABLE SERVICE (
    service_id NUMBER PRIMARY KEY,
    service_name VARCHAR2(100),
    description VARCHAR2(200)
);

INSERT INTO SERVICE (service_id, service_name, description) VALUES
(201, 'Flight Booking', 'Arranging airline tickets');

INSERT INTO SERVICE (service_id, service_name, description) VALUES
(202, 'Hotel Reservation', 'Booking hotel accommodations');

INSERT INTO SERVICE (service_id, service_name, description) VALUES
(203, 'Tour Package', 'Organizing guided tours');

INSERT INTO SERVICE (service_id, service_name, description) VALUES
(204, 'Car Rental', 'Arranging vehicle rentals');

INSERT INTO SERVICE (service_id, service_name, description) VALUES
(205, 'Travel Insurance', 'Providing insurance options');

INSERT INTO SERVICE (service_id, service_name, description) VALUES
(206, 'Visa Assistance', 'Assisting with visa applications');

-- RESERVATION Table
CREATE TABLE RESERVATION (
    reservation_id NUMBER PRIMARY KEY,
    id_passport VARCHAR2(20) REFERENCES CUSTOMER(id_passport),
    ID NUMBER REFERENCES EMPLOYEE(ID)
);

-- Insert data into RESERVATION
INSERT INTO RESERVATION (reservation_id, id_passport, ID) VALUES
(301, 'A123456', 101);
INSERT INTO RESERVATION (reservation_id, id_passport, ID) VALUES
(302, 'B234567', 102);
INSERT INTO RESERVATION (reservation_id, id_passport, ID) VALUES
(303, 'C345678', 103);
INSERT INTO RESERVATION (reservation_id, id_passport, ID) VALUES
(304, 'D456789', 104);
INSERT INTO RESERVATION (reservation_id, id_passport, ID) VALUES
(305, 'E567890', 105);
INSERT INTO RESERVATION (reservation_id, id_passport, ID) VALUES
(306, 'F678901', 106);
INSERT INTO RESERVATION (reservation_id, id_passport, ID) VALUES
(307, 'A123456', 102);
INSERT INTO RESERVATION (reservation_id, id_passport, ID) VALUES
(308, 'B234567', 104);
INSERT INTO RESERVATION (reservation_id, id_passport, ID) VALUES
(301, 'A123456', 101);
INSERT INTO RESERVATION (reservation_id, id_passport, ID) VALUES
(302, 'B234567', 102);
INSERT INTO RESERVATION (reservation_id, id_passport, ID) VALUES
(303, 'C345678', 103);
INSERT INTO RESERVATION (reservation_id, id_passport, ID) VALUES
(304, 'D456789', 104);
INSERT INTO RESERVATION (reservation_id, id_passport, ID) VALUES
(305, 'E567890', 105);
INSERT INTO RESERVATION (reservation_id, id_passport, ID) VALUES
(306, 'F678901', 106);
INSERT INTO RESERVATION (reservation_id, id_passport, ID) VALUES
(307, 'A123456', 102);
INSERT INTO RESERVATION (reservation_id, id_passport, ID) VALUES
(308, 'B234567', 104);

-- TRIP Table
CREATE TABLE TRIP (
    ID_TRIP NUMBER PRIMARY KEY,
    DATE_TRIP DATE,
    TYPE VARCHAR2(50)
);

INSERT INTO TRIP (ID_TRIP, DATE_TRIP, TYPE) VALUES
(401, TO_DATE('2024-07-01', 'YYYY-MM-DD'), 'Adventure');
INSERT INTO TRIP (ID_TRIP, DATE_TRIP, TYPE) VALUES
(402, TO_DATE('2024-08-15', 'YYYY-MM-DD'), 'Cultural');
INSERT INTO TRIP (ID_TRIP, DATE_TRIP, TYPE) VALUES
(403, TO_DATE('2024-09-20', 'YYYY-MM-DD'), 'Relaxation');
INSERT INTO TRIP (ID_TRIP, DATE_TRIP, TYPE) VALUES
(404, TO_DATE('2024-10-10', 'YYYY-MM-DD'), 'Historical');
INSERT INTO TRIP (ID_TRIP, DATE_TRIP, TYPE) VALUES
(405, TO_DATE('2024-11-05', 'YYYY-MM-DD'), 'Wildlife');
INSERT INTO TRIP (ID_TRIP, DATE_TRIP, TYPE) VALUES
(406, TO_DATE('2024-12-23', 'YYYY-MM-DD'), 'Cruise');
INSERT INTO TRIP (ID_TRIP, DATE_TRIP, TYPE) VALUES
(407, TO_DATE('2025-01-10', 'YYYY-MM-DD'), 'Skiing');
INSERT INTO TRIP (ID_TRIP, DATE_TRIP, TYPE) VALUES
(408, TO_DATE('2025-02-14', 'YYYY-MM-DD'), 'Romantic');

-- TICKETS Table
CREATE TABLE TICKETS (
    id_tickets NUMBER PRIMARY KEY,
    TYPE_SEAT VARCHAR2(20),
    time_departure TIMESTAMP,
    time_arrival TIMESTAMP,
    cost_ticket NUMBER,
    country_of_starting VARCHAR2(50),
    country_of_arrival VARCHAR2(50),
    ID_TRIP NUMBER REFERENCES TRIP(ID_TRIP)
);

INSERT INTO TICKETS (id_tickets, TYPE_SEAT, time_departure, time_arrival, cost_ticket, country_of_starting, country_of_arrival, ID_TRIP) VALUES
(501, 'Economy', TO_TIMESTAMP('2024-07-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-07-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 500, 'USA', 'Brazil', 401);
INSERT INTO TICKETS (id_tickets, TYPE_SEAT, time_departure, time_arrival, cost_ticket, country_of_starting, country_of_arrival, ID_TRIP) VALUES
(502, 'Business', TO_TIMESTAMP('2024-08-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-20 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1200, 'Canada', 'Japan', 402);
INSERT INTO TICKETS (id_tickets, TYPE_SEAT, time_departure, time_arrival, cost_ticket, country_of_starting, country_of_arrival, ID_TRIP) VALUES
(503, 'First Class', TO_TIMESTAMP('2024-09-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-09-25 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2500, 'UK', 'Australia', 403);
INSERT INTO TICKETS (id_tickets, TYPE_SEAT, time_departure, time_arrival, cost_ticket, country_of_starting, country_of_arrival, ID_TRIP) VALUES
(504, 'Economy', TO_TIMESTAMP('2024-10-10 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 600, 'Germany', 'Italy', 404);
INSERT INTO TICKETS (id_tickets, TYPE_SEAT, time_departure, time_arrival, cost_ticket, country_of_starting, country_of_arrival, ID_TRIP) VALUES
(505, 'Business', TO_TIMESTAMP('2024-11-05 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-11-10 06:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1300, 'France', 'Spain', 405);
INSERT INTO TICKETS (id_tickets, TYPE_SEAT, time_departure, time_arrival, cost_ticket, country_of_starting, country_of_arrival, ID_TRIP) VALUES
(506, 'First Class', TO_TIMESTAMP('2024-12-23 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-28 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2600, 'China', 'India', 406);
INSERT INTO TICKETS (id_tickets, TYPE_SEAT, time_departure, time_arrival, cost_ticket, country_of_starting, country_of_arrival, ID_TRIP) VALUES
(507, 'Economy', TO_TIMESTAMP('2025-01-10 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 700, 'Mexico', 'Argentina', 407);
INSERT INTO TICKETS (id_tickets, TYPE_SEAT, time_departure, time_arrival, cost_ticket, country_of_starting, country_of_arrival, ID_TRIP) VALUES
(508, 'Business', TO_TIMESTAMP('2025-02-14 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-02-19 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1400, 'South Africa', 'Kenya', 408);

-- HOTEL Table
CREATE TABLE HOTEL (
    id_hotel NUMBER PRIMARY KEY,
    name_hotel VARCHAR2(100),
    cost_hotel NUMBER,
    type_room VARCHAR2(50),
    number_days NUMBER
);
INSERT INTO HOTEL (id_hotel, name_hotel, cost_hotel, type_room, number_days) VALUES
(601, 'Luxury Suites', 200, 'Suite', 7);
INSERT INTO HOTEL (id_hotel, name_hotel, cost_hotel, type_room, number_days) VALUES
(602, 'Beach Resort', 150, 'Double', 5);
INSERT INTO HOTEL (id_hotel, name_hotel, cost_hotel, type_room, number_days) VALUES
(603, 'Mountain Lodge', 100, 'Single', 3);
INSERT INTO HOTEL (id_hotel, name_hotel, cost_hotel, type_room, number_days) VALUES
(604, 'City Center Hotel', 180, 'Deluxe', 4);
INSERT INTO HOTEL (id_hotel, name_hotel, cost_hotel, type_room, number_days) VALUES
(605, 'Family Inn', 120, 'Family', 6);
INSERT INTO HOTEL (id_hotel, name_hotel, cost_hotel, type_room, number_days) VALUES
(606, 'Historic Chateau', 250, 'Presidential', 2);
INSERT INTO HOTEL (id_hotel, name_hotel, cost_hotel, type_room, number_days) VALUES
(607, 'Ski Chalet', 170, 'Cabin', 8);
INSERT INTO HOTEL (id_hotel, name_hotel, cost_hotel, type_room, number_days) VALUES
(608, 'Ocean View Villa', 300, 'Villa', 10);

-- RESERVATION_TRIP (Associative Entity)
CREATE TABLE RESERVATION_TRIP (
    reservation_id NUMBER REFERENCES RESERVATION(reservation_id),
    ID_TRIP NUMBER REFERENCES TRIP(ID_TRIP),
    PRIMARY KEY (reservation_id, ID_TRIP)
);

INSERT INTO RESERVATION_TRIP (reservation_id, ID_TRIP) VALUES
(301, 401);
INSERT INTO RESERVATION_TRIP (reservation_id, ID_TRIP) VALUES
(302, 402);
INSERT INTO RESERVATION_TRIP (reservation_id, ID_TRIP) VALUES
(303, 403);
INSERT INTO RESERVATION_TRIP (reservation_id, ID_TRIP) VALUES
(304, 404);
INSERT INTO RESERVATION_TRIP (reservation_id, ID_TRIP) VALUES
(305, 405);
INSERT INTO RESERVATION_TRIP (reservation_id, ID_TRIP) VALUES
(306, 406);
INSERT INTO RESERVATION_TRIP (reservation_id, ID_TRIP) VALUES
(307, 407);
INSERT INTO RESERVATION_TRIP (reservation_id, ID_TRIP) VALUES
(308, 408);
-- 1. SELECT Commands
SELECT * FROM CUSTOMER;
SELECT * FROM CUSTOMER WHERE age > 40;
SELECT r.reservation_id, r.id_passport, e.FNAME, e.LNAME 
FROM RESERVATION r
JOIN EMPLOYEE e ON r.ID = e.ID;
SELECT * FROM TRIP ORDER BY DATE_TRIP ASC;

-- 2. INSERT Commands
INSERT INTO CUSTOMER (id_passport, phone_number, date_end_passport, name, age) 
VALUES ('G789012', '789-012-3456', TO_DATE('2027-06-30', 'YYYY-MM-DD'), 'Grace Hopper', 40);

INSERT INTO EMPLOYEE (ID, LNAME, FNAME) 
VALUES (107, 'Martinez', 'Carlos');

INSERT INTO SERVICE (service_id, service_name, description) 
VALUES (207, 'Event Management', 'Organizing events for customers');

-- 3. UPDATE Commands
UPDATE CUSTOMER
SET phone_number = '123-000-0000'
WHERE name = 'Alice Wonderland';

UPDATE HOTEL
SET type_room = 'Deluxe'
WHERE name_hotel = 'Mountain Lodge';

UPDATE TICKETS
SET cost_ticket = 550
WHERE id_tickets = 501;

-- 4. DELETE Commands
DELETE FROM RESERVATION
WHERE reservation_id = 301;

DELETE FROM SERVICE
WHERE service_name = 'Visa Assistance';

DELETE FROM HOTEL
WHERE name_hotel = 'Family Inn';

-- 5. ALTER Commands
ALTER TABLE CUSTOMER
ADD email VARCHAR2(100);

ALTER TABLE CUSTOMER
MODIFY phone_number VARCHAR2(30);

ALTER TABLE EMPLOYEE
DROP COLUMN middle_name;

-- 6. Aggregate Functions
SELECT COUNT(*) FROM RESERVATION;
SELECT AVG(cost_ticket) AS avg_ticket_cost FROM TICKETS;
SELECT MAX(cost_hotel) AS highest_cost FROM HOTEL;
SELECT COUNT(*) AS total_trips FROM TRIP;

-- 7. GROUP BY Commands
SELECT e.FNAME, e.LNAME, COUNT(r.reservation_id) AS total_reservations
FROM EMPLOYEE e
LEFT JOIN RESERVATION r ON e.ID = r.ID
GROUP BY e.FNAME, e.LNAME;

SELECT t.country_of_arrival, SUM(t.cost_ticket) AS total_cost
FROM TICKETS t
GROUP BY t.country_of_arrival;

-- 8. HAVING Commands
SELECT e.FNAME, e.LNAME, COUNT(r.reservation_id) AS total_reservations
FROM EMPLOYEE e
LEFT JOIN RESERVATION r ON e.ID = r.ID
GROUP BY e.FNAME, e.LNAME
HAVING COUNT(r.reservation_id) > 2;

-- 9. Subqueries
SELECT name
FROM CUSTOMER
WHERE id_passport IN (
    SELECT id_passport
    FROM RESERVATION
    WHERE reservation_id IN (
        SELECT reservation_id
        FROM TICKETS
        WHERE cost_ticket = (SELECT MAX(cost_ticket) FROM TICKETS)
    )
);

SELECT e.FNAME, e.LNAME
FROM EMPLOYEE e
WHERE e.ID = (
    SELECT ID
    FROM RESERVATION
    GROUP BY ID
    ORDER BY COUNT(*) DESC
    FETCH FIRST 1 ROWS ONLY
);

-- 10. Index and Constraint Commands
CREATE INDEX idx_phone_number ON CUSTOMER(phone_number);

ALTER TABLE RESERVATION
ADD CONSTRAINT fk_employee FOREIGN KEY (ID) REFERENCES EMPLOYEE(ID);

-- 11. Transaction Commands
BEGIN;
UPDATE CUSTOMER
SET phone_number = '123-111-2222'
WHERE id_passport = 'A123456';
COMMIT;

BEGIN;
UPDATE CUSTOMER
SET phone_number = '123-333-4444'
WHERE id_passport = 'B234567';
ROLLBACK;
