CREATE OR REPLACE PROCEDURE dia_semana(i_num in NUMBER) IS
vNum NUMBER(1):=i_num;
vResultado VARCHAR2(10);
BEGIN
    IF vNum=1 THEN
        vResultado:='Lunes';
    ELSIF vNum=2 THEN
        vResultado:='Martes';
    ELSIF vNum=3 THEN
        vResultado:='Miercoles';
    ELSIF vNum=4 THEN
        vResultado:='Jueves';
    ELSIF vNum=5 THEN
        vResultado:='Viernes';
    ELSIF vNum=6 THEN
        vResultado:='Sabado';
    ELSIF vNum=7 THEN
        vResultado:='Domingo';
    ELSE 
        vResultado:='El numero no es válido';
    END IF;
    DBMS_OUTPUT.PUT_LINE(vResultado);
END;

CALL dia_semana(5);