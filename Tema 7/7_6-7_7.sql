CREATE OR REPLACE TYPE profesor UNDER tdatospersonales(
    fecha_incorporacion DATE,
    CONSTRUCTOR FUNCTION profesor(fecha_incorporacion DATE,codigoDP NUMBER,nombreCompleto tObjNombreCompleto,domicilio tObjDomicilio,codigoPostal tObjCodPostal,fechaNacimiento DATE)
    RETURN SELF AS RESULT);

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