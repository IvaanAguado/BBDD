SET SERVEROUTPUT ON

CREATE OR REPLACE TYPE tObjCodPostal AS OBJECT(
CodProv NUMBER(2),
CodLoc NUMBER(3),
MEMBER PROCEDURE valoresCodPostal(CodProv NUMBER,CodLoc NUMBER)
)NOT FINAL;

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
)NOT FINAL;

CREATE OR REPLACE TYPE BODY tObjDomicilio AS
    MEMBER PROCEDURE valoresDomicilio(tipoVia VARCHAR2,nombreVia VARCHAR2,numero NUMBER,restoDomicilio VARCHAR2) is
    BEGIN
        SELF.tipoVia:=tipoVia;
        SELF.nombreVia:=nombreVia;
        SELF.numero:=numero;
        SELF.restoDomicilio:=restoDomicilio;
    END valoresDomicilio;
END;


CREATE OR REPLACE TYPE tObjNombreCompleto AS OBJECT(
    nombre VARCHAR2(35),
    ap1 VARCHAR2(30),
    ap2 VARCHAR2(30),
    MEMBER PROCEDURE valoresNombre(nombre VARCHAR2,ap1 VARCHAR2,ap2 VARCHAR2)
)NOT FINAL;

CREATE OR REPLACE TYPE BODY tObjNombreCompleto AS
    MEMBER PROCEDURE valoresNombre(nombre VARCHAR2,ap1 VARCHAR2,ap2 VARCHAR2) is
    BEGIN
        SELF.nombre:=nombre;
        SELF.ap1:=ap1;
        SELF.ap2:=ap2;
    END valoresNombre;
END;


CREATE OR REPLACE TYPE tDatosPersonales AS OBJECT(
    codigoDP NUMBER(4),
    nombreCompleto tObjNombreCompleto,
    domicilio tObjDomicilio,
    codigoPostal tObjCodPostal,
    fechaNacimiento DATE,
    MEMBER PROCEDURE valoresDatosPersonales(codigoDP NUMBER,nombreCompleto tObjNombreCompleto,domicilio tObjDomicilio,codigoPostal tObjCodPostal,fechaNacimiento DATE)
)NOT FINAL;

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


CREATE OR REPLACE TYPE Profesor UNDER tDatosPersonales(
    fecha_incorporacion DATE
    );

CREATE OR REPLACE TYPE BODY profesor AS
CONSTRUCTOR FUNCTION profesor(fecha_incorporacion DATE,codigoDP NUMBER,nombreCompleto tObjNombreCompleto, domicilio tObjDomicilio,codigoPostal tObjCodPostal,fechaNacimiento DATE)
RETURN SELF AS RESULT IS
BEGIN
    SELF.fecha_incorporacion :=fecha_incorporacion;
    SELF.codigoDP :=codigoDP;
    SELF.nombreCompleto := nombreCompleto;
    SELF.domicilio := domicilio;
    SELF.codigoPostal := codigoPostal;
    SELF.fechaNacimiento := fechaNacimiento;
    RETURN;
    END;
END;
    
CREATE OR REPLACE TYPE alumno UNDER tdatospersonales(
    nota1 NUMBER,
    nota2 NUMBER,
    nota3 NUMBER,
    nota4 NUMBER,
    CONSTRUCTOR FUNCTION alumno(codigoDP NUMBER,nombreCompleto tObjNombreCompleto,domicilio tObjDomicilio,codigoPostal tObjCodPostal,fechaNacimiento DATE,nota1 NUMBER,nota2 NUMBER,nota3 NUMBER,nota4 NUMBER)
    RETURN SELF AS RESULT);

CREATE OR REPLACE TYPE BODY alumno AS
CONSTRUCTOR FUNCTION alumno(codigoDP NUMBER,nombreCompleto tObjNombreCompleto,domicilio tObjDomicilio,codigoPostal tObjCodPostal,fechaNacimiento DATE,nota1 NUMBER,nota2 NUMBER,nota3 NUMBER,nota4 NUMBER)
RETURN SELF AS RESULT IS
BEGIN
    SELF.codigoDP :=codigoDP;
    SELF.nombreCompleto := nombreCompleto;
    SELF.domicilio := domicilio;
    SELF.codigoPostal := codigoPostal;
    SELF.fechaNacimiento := fechaNacimiento;
    SELF.nota1 := nota1;
    SELF.nota2 := nota2;
    SELF.nota3 := nota3;
    SELF.nota4 := nota4;
    RETURN;
    END;
END;

DECLARE
    p1 Profesor;
    domicilio1 tObjDomicilio:=tObjDomicilio('Plaza','España',103,'1ºA', 'Madrid');
    nombre1 tObjNombreCompleto:=tObjNombreCompleto('Dolores','SANCHEZ','GOMEZ,');
    codigoPostal1 tObjCodPostal:=tObjCodPostal(28,001);
    
    a1 Alumno;
    domicilio2 tObjDomicilio:=tObjDomicilio('Calle','Laguna',12,NULL, 'BOADILLA DEL MONTE');
    nombre2 tObjNombreCompleto:=tObjNombreCompleto('Luis','MARIN','SOL,');
    codigoPostal2 tObjCodPostal:=tObjCodPostal(28,660);
    
BEGIN
    p1 := NEW Profesor('01-09-2021',34,nombre1,domicilio1,codigoPostal1,'18-04-1991');
    a1 := NEW Alumno(nombre2,domicilio2,codigoPostal2,4,4,5,7);
    
END;