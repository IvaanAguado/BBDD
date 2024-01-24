SELECT
	NOMBRE
FROM
	DATOSPERSONALES, PROFESOR, IDIOMA, IDIOMASPROF
WHERE
	TIPO='PROFESOR'
AND
	DESCRIPCION='Español'
AND
	DATOSPERSONALES.DNI=PROFESOR.DNI
AND 
	PROFESOR.DNI=IDIOMASPROF.DNI 
AND
	IDIOMASPROF.CODIDIOMA=IDIOMA.CODIDIOMA;


SELECT
	ASIGNATURA.NOMBRE
FROM
	CICLOFORM, ASIGNATURA
WHERE
	CICLOFORM.NOMBRE='DAM'
AND 
	CICLOFORM.CODCICLO=ASIGNATURA.CODCICLO;


SELECT
	PROFESOR.CUENTA, DATOSPERSONALES.NOMBRE
FROM 
	PROFESOR, DATOSPERSONALES
WHERE
	PROFESOR.DNI=DATOSPERSONALES.DNI;


SELECT
	DATOSPERSONALES.* 
FROM 
	DATOSPERSONALES
WHERE
	DATOSPERSONALES.TIPO='ALUMNO';


SELECT
	DATOSPERSONALES.* 
FROM 
	DATOSPERSONALES
WHERE
	DATOSPERSONALES.TIPO='PROFESOR';


SELECT
	ALUMNO.EMAIL,DATOSPERSONALES.NOMBRE
FROM 
	ALUMNO,DATOSPERSONALES
WHERE
	ALUMNO.DNI=DATOSPERSONALES.DNI;


SELECT
	ALUMNO.EMAIL,DATOSPERSONALES.NOMBRE
FROM 
	ALUMNO,DATOSPERSONALES,ASIGNATURA,MATRICULA
WHERE
	ALUMNO.DNI=DATOSPERSONALES.DNI
AND
	ASIGNATURA.NOMBRE='Empresa'
AND
	DATOSPERSONALES.DNI=MATRICULA.DNI 
AND
	MATRICULA.CODASIG=ASIGNATURA.CODASIG;


SELECT DISTINCT
	DATOSPERSONALES.NOMBRE, CICLOFORM.NOMBRE
FROM 
	DATOSPERSONALES,MATRICULA,ASIGNATURA,CICLOFORM
WHERE 
	DATOSPERSONALES.DNI=MATRICULA.DNI 
AND
	MATRICULA.CODASIG=ASIGNATURA.CODASIG
AND
	ASIGNATURA.CODCICLO=CICLOFORM.CODCICLO;


SELECT
	DATOSPERSONALES.NOMBRE, ASIGNATURA.NOMBRE
FROM
	DATOSPERSONALES,MATRICULA,ASIGNATURA
WHERE
	DATOSPERSONALES.NOMBRE='PEDRO'
AND
	DATOSPERSONALES.DNI=MATRICULA.DNI 
AND 
	MATRICULA.CODASIG=ASIGNATURA.CODASIG;


SELECT
	CICLOFORM.NOMBRE
FROM 
	CICLOFORM
WHERE
	CICLOFORM.TIPO='GRADO SUPERIOR'


SELECT
	ASIGNATURA.NOMBRE, CICLOFORM.NOMBRE
FROM 
	CICLOFORM,ASIGNATURA
WHERE
	CICLOFORM.CODCICLO=ASIGNATURA.CODCICLO


SELECT
	ASIGNATURA.NUMHORAS, ASIGNATURA.NOMBRE
FROM 
	ASIGNATURA
WHERE
	NUMHORAS<200


SELECT
	*
FROM 
	DATOSPERSONALES
WHERE
	DATOSPERSONALES.NOMBRE='ANDREA';
UPDATE
	DATOSPERSONALES
SET 
	DATOSPERSONALES.AP2=NULL
WHERE
	DATOSPERSONALES.NOMBRE='ANDREA'


SELECT
	*
FROM 
	MATRICULA, ASIGNATURA
WHERE
	MATRICULA.CODASIG=ASIGNATURA.CODASIG
AND
	ASIGNATURA.NOMBRE='Programación'
DELETE MATRICULA WHERE MATRICULA.CODASIG=5


SELECT
	ASIGNATURA.*
FROM
	ASIGNATURA, MATRICULA
WHERE
	MATRICULA.CODASIG=ASIGNATURA.CODASIG
AND
	ASIGNATURA.NOMBRE='Empresa'
DELETE MATRICULA WHERE MATRICULA.CODASIG=1
DELETE ASIGNATURA WHERE ASIGNATURA.NOMBRE='Empresa'


SELECT
	ASIGNATURA.NOMBRE
FROM
	ASIGNATURA
WHERE
	ASIGNATURA.NOMBRE='Bases de datos'
UPDATE
	ASIGNATURA
SET 
	ASIGNATURA.NOMBRE='BBDD'
WHERE
	ASIGNATURA.NOMBRE='Bases de datos'


INSERT INTO CICLOFORM(CODCICLO,NOMBRE,TIPO)VALUES(6365, 'ELEC', 'GRADO MEDIO');

INSERT INTO ASIGNATURA(CODASIG,NOMBRE,NUMHORAS,DNI,CODCICLO)VALUES(1, 'Circuitos Baja Potencia', 100, '89621477A', 6365);


SELECT
	DATOSPERSONALES.NOMBRE, ASIGNATURA.NOMBRE
FROM
	ASIGNATURA, MATRICULA, DATOSPERSONALES
WHERE
	DATOSPERSONALES.DNI=MATRICULA.DNI 
AND
	MATRICULA.CODASIG=ASIGNATURA.CODASIG
AND
	DATOSPERSONALES.NOMBRE='PEDRO'
UPDATE
	MATRICULA
SET 
	MATRICULA.CODASIG=3
WHERE
	MATRICULA.CODASIG=2
AND
	MATRICULA.DNI='11526987G'


INSERT INTO IDIOMA(CODIDIOMA,DESCRIPCION)VALUES(50, 'Alemán');

INSERT INTO IDIOMASPROF(CODIDIOMA,DNI)VALUES(50, '44103779F');
