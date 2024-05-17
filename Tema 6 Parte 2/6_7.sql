CREATE OR REPLACE FUNCTION par_impar(i_num in NUMBER) 
RETURN VARCHAR2
IS vResultado VARCHAR2(5);
vNum NUMBER(3):=i_num;
BEGIN
    IF vNum MOD 2=0 THEN
        vResultado:='TRUE';
    ELSE
        vResultado:='FALSE';
    END IF;
RETURN vResultado;

END;

SELECT par_impar(5) FROM DUAL;