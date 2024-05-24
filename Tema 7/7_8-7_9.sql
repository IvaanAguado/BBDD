CREATE OR REPLACE TYPE empleado AS OBJECT(
    dni VARCHAR2(9),
    nombre VARCHAR2(30),
    ap1 VARCHAR2(30),
    ap2 VARCHAR2(30),
    telefono VARCHAR2(9)
) NOT FINAL;

CREATE OR REPLACE TYPE inspector UNDER empleado(
    especialidad VARCHAR2(30));
    
CREATE OR REPLACE TYPE policia UNDER empleado(
    categoria VARCHAR2(20),
    salario NUMBER,
    MEMBER FUNCTION calculaSalario(salario NUMBER) RETURN NUMBER);
   
DROP TABLE POLICIAS;
ALTER TYPE policia MODIFY ATTRIBUTE categoria VARCHAR2(30);
   
CREATE OR REPLACE TYPE BODY policia AS
    MEMBER FUNCTION calculaSalario(salario NUMBER) RETURN NUMBER IS
    salarioFinal NUMBER;
    BEGIN
        IF (SELF.categoria = 'LOCAL') THEN
            salarioFinal := salario*1.05;
        ELSIF (SELF.categoria = 'NACIONAL') THEN
            salarioFinal := salario*1.15;
        ELSIF (SELF.categoria = 'OPERACIONES ESPECIALES') THEN
            salarioFinal := salario*1.20;
        END IF;
        
        RETURN salarioFinal;
    END;
END;


CREATE TABLE POLICIAS OF POLICIA;

CREATE TABLE RESPONSABLES OF INSPECTOR;

SET SERVEROUTPUT ON

DECLARE
    poli1 policia;
    poli2 policia;
    poli3 policia;
    v_salario NUMBER;
    salario NUMBER;
BEGIN
    poli1 := policia('98743578N','Pedro','Lopez','Garcia','654289456','LOCAL',1500);
    poli2 := policia('56745678Y','Juan','Hernandez','Nieto','658519456','NACIONAL',1700);
    poli3 := policia('47328694U','Jorge','Casillas','Medina','693239456','OPERACIONES ESPECIALES',2000);
    DBMS_OUTPUT.PUT_LINE(poli1.telefono);
    DBMS_OUTPUT.PUT_LINE(poli2.nombre);
    DBMS_OUTPUT.PUT_LINE(poli3.dni || ' - ' || poli3.nombre);
    
    salario := poli1.salario;
    v_salario := poli1.calculaSalario(salario);
    DBMS_OUTPUT.PUT_LINE(v_salario);
    
    salario := poli2.salario;
    v_salario := poli2.calculaSalario(salario);
    DBMS_OUTPUT.PUT_LINE(v_salario);
    
    salario := poli3.salario;
    v_salario := poli3.calculaSalario(salario);
    DBMS_OUTPUT.PUT_LINE(v_salario);
    
    INSERT INTO policias VALUES (poli1);
    INSERT INTO policias VALUES (poli2);
    INSERT INTO policias VALUES (poli3);
    COMMIT;
    
    UPDATE policias SET salario=poli1.calculaSalario(salario) WHERE DNI=poli1.dni;
    UPDATE policias SET salario=poli2.calculaSalario(salario) WHERE DNI=poli2.dni;
    UPDATE policias SET salario=poli3.calculaSalario(salario) WHERE DNI=poli3.dni;
    
END;


DECLARE
    inspector1 inspector;
    inspector2 inspector;

BEGIN
    inspector1 := inspector('98743578N','Luis','Lopez','Garcia','654289456','GEO');
    inspector2 := inspector('56745678Y','Juan','Hernandez','Nieto','658519456','FORENSE');
    DBMS_OUTPUT.PUT_LINE(inspector1.telefono);
    DBMS_OUTPUT.PUT_LINE(inspector2.nombre);
    DBMS_OUTPUT.PUT_LINE(inspector2.dni || ' - ' || inspector2.nombre);
    
    INSERT INTO responsables VALUES (inspector1);
    INSERT INTO responsables VALUES (inspector2);
    COMMIT;

END;