SET SERVEROUTPUT ON

CREATE OR REPLACE TYPE persona2 AS OBJECT(
    nombre VARCHAR2(20),
    apellidos VARCHAR2(30),
    edad NUMBER,
    CONSTRUCTOR FUNCTION persona2(nombre VARCHAR2, apellidos VARCHAR2, edad NUMBER)
    RETURN SELF AS RESULT);

CREATE OR REPLACE TYPE BODY persona2 AS
CONSTRUCTOR FUNCTION persona2(
    nombre VARCHAR2,
    apellidos VARCHAR2,
    edad NUMBER
) RETURN SELF AS RESULT IS
BEGIN
    SELF.nombre := nombre;
    SELF.apellidos := apellidos;
    SELF.edad := edad;
    RETURN;
    END;
END;

DECLARE
    vPersona persona2;
BEGIN
    vPersona := NEW persona2('Ivan','Aguado',20);
    DBMS_OUTPUT.PUT_LINE(vPersona.nombre || ' - ' || vPersona.edad);
END;