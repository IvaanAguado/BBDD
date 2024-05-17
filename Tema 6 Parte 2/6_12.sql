CREATE OR REPLACE PROCEDURE actualizar_fecha_alta(i_departamento IN VARCHAR2)IS
v_departamento VARCHAR2(20):=i_departamento;
v_fecha date;
v_ok VARCHAR2(2):='OK';
BEGIN
    SELECT MIN(datospersonales.fecha_alta) INTO v_fecha FROM datospersonales,empleados,departamento 
    WHERE datospersonales.clave_empleado=empleados.id_empleado AND empleados.id_departamento=departamento.id_departamento AND departamento.nombre=v_departamento;
    UPDATE datospersonales SET fecha_alta=SYSDATE WHERE fecha_alta=v_fecha;
    DBMS_OUTPUT.PUT_LINE(v_ok);
END;

CALL actualizar_fecha_alta('Contabilidad');