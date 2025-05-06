-- 1. Simple PL/SQL Program
-- This program simply prints "Hello, World!"

DECLARE
  message VARCHAR2(20) := 'Hello, World!';
BEGIN
  DBMS_OUTPUT.PUT_LINE(message);
END;
/

-- 2. PL/SQL Program with Conditional Statements
-- This program checks the age of a customer and prints a message.

DECLARE
  customer_age NUMBER;
  message VARCHAR2(100);
BEGIN
  -- Fetch the age of a customer.  I'm hardcoding 'A123456' for this example.
  SELECT age INTO customer_age FROM CUSTOMER WHERE id_passport = 'A123456';

  IF customer_age >= 18 THEN
    message := 'Customer is an adult.';
  ELSE
    message := 'Customer is a minor.';
  END IF;

  DBMS_OUTPUT.PUT_LINE(message);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Customer not found.');
END;
/

-- 3. PL/SQL Program with a Loop
-- This program iterates through a cursor and prints the names of all employees.

DECLARE
  CURSOR emp_cursor IS
    SELECT FNAME, LNAME FROM EMPLOYEE;
  emp_fname VARCHAR2(50);
  emp_lname VARCHAR2(50);
BEGIN
  OPEN emp_cursor;
  LOOP
    FETCH emp_cursor INTO emp_fname, emp_lname;
    EXIT WHEN emp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(emp_fname || ' ' || emp_lname);
  END LOOP;
  CLOSE emp_cursor;
END;
/

-- 4. PL/SQL program to calculate the total cost of all tickets.
DECLARE
  total_cost NUMBER := 0;

BEGIN
  FOR ticket IN (SELECT cost_ticket FROM TICKETS) LOOP
    total_cost := total_cost + ticket.cost_ticket;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Total cost of all tickets: ' || total_cost);
END;
/

-- 5. PL/SQL program using a WHILE loop
-- This program will print hotel names and costs, as long as the cost is below 200
DECLARE
 CURSOR hotel_cursor IS
  SELECT name_hotel, cost_hotel FROM HOTEL;
  hotel_name VARCHAR2(100);
  hotel_cost NUMBER;
BEGIN
  OPEN hotel_cursor;
  FETCH hotel_cursor INTO hotel_name, hotel_cost;
  WHILE hotel_cursor%FOUND LOOP
   DBMS_OUTPUT.PUT_LINE(hotel_name || ' costs: ' || hotel_cost);
   FETCH hotel_cursor into hotel_name, hotel_cost;
  END LOOP;
  CLOSE hotel_cursor;
END;
/
