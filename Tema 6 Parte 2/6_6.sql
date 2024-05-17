CREATE OR REPLACE PROCEDURE obtener_fecha_viaje IS
    v_fecha_viaje DATE;
    vNum VARCHAR(7);
BEGIN
    SELECT MIN(NUM_EMPLEADO) INTO vNum FROM conductor;
    SELECT viajes.fecha INTO v_fecha_viaje FROM viajes,conductor WHERE viajes.dni_conductor=conductor.dni AND conductor.num_empleado=vNum FETCH FIRST 1 ROWS ONLY;

    DBMS_OUTPUT.PUT_LINE('La fecha del viaje es: ' || TO_CHAR(v_fecha_viaje, 'DD-MM-YYYY'));
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron viajes.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END;

BEGIN 
    obtener_fecha_viaje;
END;