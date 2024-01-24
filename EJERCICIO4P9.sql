CREATE TABLE TIPODP(
	CODTIPO NUMBER(4) NOT NULL,
	DESCRIPCION VARCHAR(42) NOT NULL,
	CONSTRAINT PK_TIPODP PRIMARY KEY(CODTIPO)
);

ALTER TABLE DATOSPERSONALES ADD CONSTRAINT FK_TIPODP FOREIGN KEY(TIPO) REFERENCES TIPODP(CODTIPO);

ALTER TABLE DATOSPERSONALES MODIFY TELEFONO NOT NULL;
ALTER TABLE DATOSPERSONALES MODIFY CORREO NOT NULL;

ALTER TABLE DIRECTOR ADD ANIOS NUMBER(2) NOT NULL;

ALTER TABLE COMERCIAL DROP COLUMN COMISION;

ALTER TABLE OFICINA ADD COMISION NUMBER(2) NOT NULL;

CREATE TABLE TURNO(
 	CODTURNO NUMBER(3) NOT NULL,
 	DESCRIPCION VARCHAR(42) NOT NULL,
 	CONSTRAINT PK_TURNO PRIMARY KEY(CODTURNO)
);

ALTER TABLE VENDEDOR ADD CONSTRAINT FK_TURNO FOREIGN KEY(TURNO) REFERENCES TURNO(CODTURNO);

CREATE TABLE TEMATICALIBRO(
	CODTEM NUMBER(2) NOT NULL,
	DESCRIPCION VARCHAR(42) NOT NULL,
	CONSTRAINT PK_TEMATICALIBRO PRIMARY KEY(CODTEM)
);

ALTER TABLE LIBRO RENAME TEMATICA TO CODTEM;

ALTER TABLE LIBRO ADD CONSTRAINT FK_TEMATICALIBRO FOREIGN KEY(TEMATICA) REFERENCES TEMATICALIBRO(CODTEM);

ALTER TABLE LIBRO RENAME PRECIO TO PRECIOACTUAL;
