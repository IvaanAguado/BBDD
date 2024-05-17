CREATE OR REPLACE PROCEDURE DNIEMPLEADOS(i_cod in VARCHAR2) IS
vCodigo VARCHAR2(7):=i_cod;
vDni VARCHAR2(9);
BEGIN
SELECT dni INTO vDni FROM datospersonales WHERE clave_empleado=vCodigo;
DBMS_OUTPUT.PUT_LINE(vDni);
END;

CALL DNIEMPLEADOS('EMP06');

CREATE OR REPLACE FUNCTION contar_empleados
RETURN NUMBER
IS
    vNum NUMBER;
BEGIN
    SELECT COUNT(*) INTO vNum FROM departamento,empleados WHERE departamento.id_departamento=empleados.id_departamento AND departamento.nombre='Personal';
    RETURN vNum;
END;

SELECT contar_empleados FROM DUAL;

CREATE OR REPLACE FUNCTION contar_empleados2(i_departamento in VARCHAR2)
RETURN NUMBER
IS
    vNum NUMBER;
vDepartamento VARCHAR2(15):=i_departamento;
BEGIN
    SELECT COUNT(*) INTO vNum FROM departamento,empleados WHERE departamento.id_departamento=empleados.id_departamento AND departamento.nombre=vDepartamento;
    RETURN vNum;
END;

SELECT contar_empleados2('Almacen') FROM DUAL;
