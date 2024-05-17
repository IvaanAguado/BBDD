CREATE OR REPLACE FUNCTION area_circulo(i_radio IN NUMBER)
RETURN NUMBER
IS
  v_area NUMBER;
BEGIN
  v_area := 3.14 * i_radio * i_radio;
RETURN v_area;
END;

SELECT area_circulo(5) FROM dual;