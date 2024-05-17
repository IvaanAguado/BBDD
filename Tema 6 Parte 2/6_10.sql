CREATE OR REPLACE FUNCTION mayor(num1 IN NUMBER, num2 IN NUMBER, num3 IN NUMBER)
RETURN NUMBER
IS
    v_mayor NUMBER;
BEGIN
    v_mayor := num1;
    IF num2 > v_mayor THEN
        v_mayor := num2;
    END IF;
    
    IF num3 > v_mayor THEN
        v_mayor := num3;
    END IF;
    RETURN v_mayor;
END;

SELECT mayor(1,2,3) FROM DUAL;