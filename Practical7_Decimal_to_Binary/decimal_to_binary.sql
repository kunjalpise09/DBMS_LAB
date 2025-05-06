CREATE OR REPLACE FUNCTION decimal_to_binary (
    decimal_num IN NUMBER
) RETURN VARCHAR2 IS
    binary_string VARCHAR2(255);
    temp_num NUMBER;
BEGIN
    IF decimal_num = 0 THEN
        RETURN '0';
    END IF;

    binary_string := '';
    temp_num := decimal_num;

    WHILE temp_num > 0 LOOP
        binary_string := MOD(temp_num, 2) || binary_string;
        temp_num := TRUNC(temp_num / 2);
    END LOOP;

    RETURN binary_string;
EXCEPTION
    WHEN OTHERS THEN
        RETURN SQLERRM;
END;
/

-- Example Usage:
DECLARE
    decimal_value NUMBER := 25;
    binary_value VARCHAR2(255);
BEGIN
    binary_value := decimal_to_binary(decimal_value);
    DBMS_OUTPUT.PUT_LINE('The binary equivalent of ' || decimal_value || ' is ' || binary_value);
END;
/
