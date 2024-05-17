CREATE OR REPLACE FUNCTION apellidos_conductor(dni IN VARCHAR2)
RETURN VARCHAR2
IS vResultado VARCHAR2(30);
vDni VARCHAR2(9):=dni;
BEGIN
    SELECT empleados.apellidos INTO vResultado 
    FROM empleados,datospersonales 
    WHERE empleados.id_empleado=datospersonales.clave_empleado AND datospersonales.dni=vDni;
    RETURN vResultado;
END;

SELECT apellidos_conductor('71045896C') FROM DUAL;
