SET SERVEROUTPUT ON;

CREATE OR REPLACE TYPE Persona AS OBJECT (
    dni VARCHAR2(20),
    nombre VARCHAR2(50),
    apellidos VARCHAR2(50),
    fecha_de_nacimiento DATE,
    MEMBER FUNCTION muestraEdad RETURN NUMBER
);


CREATE OR REPLACE TYPE BODY Persona AS
    MEMBER FUNCTION muestraEdad RETURN NUMBER IS
        v_edad NUMBER;
    BEGIN
        v_edad := EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM fecha_de_nacimiento);
        
        IF TO_CHAR(SYSDATE, 'MMDD') < TO_CHAR(fecha_de_nacimiento, 'MMDD') THEN
            v_edad := v_edad - 1;
        END IF;
        
        RETURN v_edad;
    END muestraEdad;
END;

DECLARE
    persona1 Persona;
    edad NUMBER;
BEGIN
    persona1 := Persona('12345678A', 'Juan', 'Perez', TO_DATE('1990-05-20', 'YYYY-MM-DD'));
    
    edad := persona1.muestraEdad;
    
    DBMS_OUTPUT.PUT_LINE('La edad de ' || persona1.nombre || ' es: ' || edad);
END;