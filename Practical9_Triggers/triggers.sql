-- 1. Simple Trigger (BEFORE INSERT)
-- This trigger will set the customer's age to 18 if it is NULL before a new customer is inserted.
CREATE OR REPLACE TRIGGER set_default_age
BEFORE INSERT ON CUSTOMER
FOR EACH ROW
BEGIN
  IF :NEW.age IS NULL THEN
    :NEW.age := 18;
  END IF;
END;
/

-- Example Usage:
-- Insert a new customer without specifying the age.
INSERT INTO CUSTOMER (id_passport, phone_number, date_end_passport, name)
VALUES ('X123456', '555-123-4567', TO_DATE('2029-01-01', 'YYYY-MM-DD'), 'John Doe');

-- Verify that the age was set to 18 by the trigger.
SELECT * FROM CUSTOMER WHERE id_passport = 'X123456';



-- 2. BEFORE UPDATE Trigger
-- This trigger prevents a customer's age from being updated to a value less than 18.
CREATE OR REPLACE TRIGGER prevent_age_update
BEFORE UPDATE ON CUSTOMER
FOR EACH ROW
BEGIN
  IF :NEW.age < 18 THEN
    RAISE_APPLICATION_ERROR(-20003, 'Age cannot be less than 18.');
  END IF;
END;
/

-- Example Usage:
-- Try to update the age of the customer inserted in the previous example.
UPDATE CUSTOMER SET age = 16 WHERE id_passport = 'X123456';  -- This will raise an error.

-- Verify that the age was not updated.
SELECT * FROM CUSTOMER WHERE id_passport = 'X123456';



-- 3. AFTER INSERT Trigger 
-- This trigger will insert a new record into the RESERVATION table after a new customer is inserted.
CREATE OR REPLACE TRIGGER create_reservation_for_new_customer
AFTER INSERT ON CUSTOMER
FOR EACH ROW
DECLARE
    new_reservation_id NUMBER;
BEGIN
    -- Generate a new reservation ID (you might have a sequence for this).
    SELECT MAX(reservation_id) + 1 INTO new_reservation_id FROM RESERVATION;
    IF new_reservation_id IS NULL THEN
        new_reservation_id := 1;
    END IF;

    -- Insert a new reservation for the new customer.
    INSERT INTO RESERVATION (reservation_id, id_passport, ID)  --  Added ID
    VALUES (new_reservation_id, :NEW.id_passport, 101);  -- Hardcoded ID for example
END;
/

-- Example Usage
-- Insert a new customer.  This will automatically create a reservation.
INSERT INTO CUSTOMER (id_passport, phone_number, date_end_passport, name, age)
VALUES ('Y789012', '555-987-6543', TO_DATE('2028-06-30', 'YYYY-MM-DD'), 'Jane Smith', 25);

-- Verify that a reservation was created for the new customer.
SELECT * FROM RESERVATION WHERE id_passport = 'Y789012';



-- 4. BEFORE INSERT OR UPDATE Trigger
CREATE OR REPLACE TRIGGER check_passport_expiry
BEFORE INSERT OR UPDATE ON CUSTOMER
FOR EACH ROW
BEGIN
  IF :NEW.date_end_passport < SYSDATE THEN
    RAISE_APPLICATION_ERROR(-20004, 'Passport has expired.');
  END IF;
END;
/

--Example Usage
-- Insert a customer with an expired passport
INSERT INTO CUSTOMER (id_passport, phone_number, date_end_passport, name, age)
VALUES ('Z123456', '555-111-2222', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'Expired Customer', 25);

--Try to update a customer with an expired passport
UPDATE CUSTOMER SET date_end_passport = TO_DATE('2022-01-01', 'YYYY-MM-DD')
WHERE id_passport = 'A123456';
