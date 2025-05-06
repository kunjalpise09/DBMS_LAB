CREATE OR REPLACE PROCEDURE transfer_funds (
    from_account_id IN VARCHAR2,
    to_account_id IN VARCHAR2,
    amount IN NUMBER
) IS
    from_balance NUMBER;
    to_balance NUMBER;
BEGIN
    -- 1. Check if the sending account has sufficient funds.
    SELECT balance INTO from_balance
    FROM ACCOUNT
    WHERE account_id = from_account_id;

    IF from_balance < amount THEN
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds.');
    END IF;

    -- 2. Deduct the amount from the sending account.
    UPDATE ACCOUNT
    SET balance = balance - amount
    WHERE account_id = from_account_id;

    -- 3. Add the amount to the receiving account.
    UPDATE ACCOUNT
    SET balance = balance + amount
    WHERE account_id = to_account_id;

    -- 4.  Optionally, commit the transaction.  Important for making the changes permanent.
    COMMIT;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Handle the case where either account doesn't exist.
        RAISE_APPLICATION_ERROR(-20002, 'Invalid account ID.');
    WHEN OTHERS THEN
        -- Handle other potential errors (e.g., database connection issues).
        ROLLBACK;  -- Very important:  Roll back the transaction on error.
        RAISE_APPLICATION_ERROR(-20000, 'An error occurred: ' || SQLERRM);
END;
/

-- Example Usage:
DECLARE
  from_acc VARCHAR2(20) := '1001';  -- Replace with actual account IDs
  to_acc VARCHAR2(20) := '1002';
  transfer_amount NUMBER := 100;
BEGIN
  -- First, let's set up some dummy accounts (if they don't exist)
  BEGIN
    INSERT INTO ACCOUNT (account_id, balance) VALUES ('1001', 1000);
    EXCEPTION WHEN OTHERS THEN NULL; END;
  BEGIN
    INSERT INTO ACCOUNT (account_id, balance) VALUES ('1002', 500);
    EXCEPTION WHEN OTHERS THEN NULL; END;

  transfer_funds(from_acc, to_acc, transfer_amount);
  DBMS_OUTPUT.PUT_LINE('Funds transferred successfully.');

  -- Display updated balances (optional)
  DECLARE
    new_from_balance NUMBER;
    new_to_balance NUMBER;
  BEGIN
    SELECT balance INTO new_from_balance FROM ACCOUNT WHERE account_id = from_acc;
    SELECT balance INTO new_to_balance FROM ACCOUNT WHERE account_id = to_acc;
    DBMS_OUTPUT.PUT_LINE('Account ' || from_acc || ' new balance: ' || new_from_balance);
    DBMS_OUTPUT.PUT_LINE('Account ' || to_acc || ' new balance: ' || new_to_balance);
  END;
END;
/
