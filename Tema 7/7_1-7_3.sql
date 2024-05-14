CREATE OR REPLACE TYPE tObjCodPostal AS OBJECT(
CodProv NUMBER(2),
CodLoc NUMBER(3),
MEMBER PROCEDURE valoresCodPostal(CodProv NUMBER,CodLoc NUMBER)
);

CREATE OR REPLACE TYPE BODY tObjCodPostal AS 
    MEMBER PROCEDURE valoresCodPostal(CodProv NUMBER,CodLoc NUMBER) is
    BEGIN
        SELF.CodProv:=CodProv;
        SELF.CodLoc:=CodLoc;
    END valoresCodPostal;
END;


DECLARE
cod1 tObjCodPostal:=tObjCodPostal(47,012);
BEGIN
    DBMS_OUTPUT.PUT_LINE(cod1.CodLoc);
    cod1.valoresCodPostal(37,034);
    DBMS_OUTPUT.PUT_LINE(cod1.CodLoc);
END;


CREATE OR REPLACE TYPE tObjDomicilio AS OBJECT(
tipoVia VARCHAR2(10),
nombreVia VARCHAR2(25),
numero NUMBER(3),
restoDomicilio VARCHAR2(10),
MEMBER PROCEDURE valoresDomicilio(tipoVia VARCHAR2,nombreVia VARCHAR2,numero NUMBER,restoDomicilio VARCHAR2)
);

CREATE OR REPLACE TYPE BODY tObjDomicilio AS
    MEMBER PROCEDURE valoresDomicilio(tipoVia VARCHAR2,nombreVia VARCHAR2,numero NUMBER,restoDomicilio VARCHAR2) is
    BEGIN
        SELF.tipoVia:=tipoVia;
        SELF.nombreVia:=nombreVia;
        SELF.numero:=numero;
        SELF.restoDomicilio:=restoDomicilio;
    END valoresDomicilio;
END;

DECLARE
cod1 tObjDomicilio:=tObjDomicilio('Calle','Arca Real',7,'SaFa');
BEGIN
    DBMS_OUTPUT.PUT_LINE(cod1.tipoVia);
    cod1.valoresDomicilio('Avenida','Arca Real',7,'SaFa');
    DBMS_OUTPUT.PUT_LINE(cod1.tipoVia);
END;


CREATE OR REPLACE TYPE tObjNombreCompleto AS OBJECT(
    nombre VARCHAR2(35),
    ap1 VARCHAR2(30),
    ap2 VARCHAR2(30),
    MEMBER PROCEDURE valoresNombre(nombre VARCHAR2,ap1 VARCHAR2,ap2 VARCHAR2)
);

CREATE OR REPLACE TYPE BODY tObjNombreCompleto AS
    MEMBER PROCEDURE valoresNombre(nombre VARCHAR2,ap1 VARCHAR2,ap2 VARCHAR2) is
    BEGIN
        SELF.nombre:=nombre;
        SELF.ap1:=ap1;
        SELF.ap2:=ap2;
    END valoresNombre;
END;

DECLARE
cod1 tObjNombreCompleto:=tObjNombreCompleto('Ivan','Aguado','Fraile');
BEGIN
    DBMS_OUTPUT.PUT_LINE(cod1.nombre);
    cod1.valoresNombre('Juan','Aguado','Fraile');
    DBMS_OUTPUT.PUT_LINE(cod1.nombre);
END;

CREATE OR REPLACE TYPE tDatosPersonales AS OBJECT(
    codigoDP NUMBER(4),
    nombreCompleto tObjNombreCompleto,
    domicilio tObjDomicilio,
    codigoPostal tObjCodPostal,
    fechaNacimiento DATE,
    MEMBER PROCEDURE valoresDatosPersonales(codigoDP NUMBER,nombreCompleto tObjNombreCompleto,domicilio tObjDomicilio,codigoPostal tObjCodPostal,fechaNacimiento DATE)
);

CREATE OR REPLACE TYPE BODY tDatosPersonales AS
    MEMBER PROCEDURE valoresDatosPersonales(codigoDP NUMBER,nombreCompleto tObjNombreCompleto,domicilio tObjDomicilio,codigoPostal tObjCodPostal,fechaNacimiento DATE) is
    BEGIN
        SELF.codigoDP:=codigoDP;
        SELF.nombreCompleto:=nombreCompleto;
        SELF.domicilio:=domicilio;
        SELF.codigoPostal:=codigoPostal;
        SELF.fechaNacimiento:=fechaNacimiento;
    END valoresDatosPersonales;
END;

DECLARE
domicilio1 tObjDomicilio:=tObjDomicilio('Avenida','Postigo',100,'1ºA');
nombre1 tObjNombreCompleto:=tObjNombreCompleto('Angela','Negro','Castilla');
codigoPostal1 tObjCodPostal:=tObjCodPostal(41,001);
datos tDatosPersonales:=tDatosPersonales(345,nombre1,domicilio1,codigoPostal1,'18-04-1991');
BEGIN
    DBMS_OUTPUT.PUT_LINE(datos.fechaNacimiento);
    datos.valoresDatosPersonales(234,nombre1,domicilio1,codigoPostal1,'18-04-1992');
    DBMS_OUTPUT.PUT_LINE(datos.fechaNacimiento);
END;

DECLARE
domicilio1 tObjDomicilio:=tObjDomicilio('Calle','Salado',114,'21ºIzq B2');
nombre1 tObjNombreCompleto:=tObjNombreCompleto('Tom','Oxley','');
codigoPostal1 tObjCodPostal:=tObjCodPostal(28,001);
datos tDatosPersonales:=tDatosPersonales(345,nombre1,domicilio1,codigoPostal1,'30-05-1983');
BEGIN
    DBMS_OUTPUT.PUT_LINE(datos.fechaNacimiento);
    datos.valoresDatosPersonales(234,nombre1,domicilio1,codigoPostal1,'18-04-1992');
    DBMS_OUTPUT.PUT_LINE(datos.fechaNacimiento);
END;