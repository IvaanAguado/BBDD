DECLARE
    CURSOR cCursor IS
    SELECT empleados.nombre,datospersonales.fecha_alta 
    FROM empleados,datospersonales
    WHERE empleados.id_empleado=datospersonales.clave_empleado;
    vCampos cCursor%ROWTYPE;

BEGIN
OPEN cCursor;
LOOP
    FETCH cCursor INTO vCampos;
    EXIT WHEN cCursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(vCampos.nombre|| ' - ' ||vCampos.fecha_alta);
END LOOP;
END;