ALTER TABLE DIRECTOR ADD CONSTRAINT UK_DIRECTOR UNIQUE(TELEFONO);
ALTER TABLE DIRECTOR ADD CONSTRAINT UK_DIRECTOR UNIQUE(EMAIL);

ALTER TABLE VENDEDOR ADD CONSTRAINT UK_VENDEDOR UNIQUE(TELEFONO);
ALTER TABLE VENDEDOR ADD CONSTRAINT UK_VENDEDOR UNIQUE(EMAIL);

ALTER TABLE CLIENTE ADD CONSTRAINT UK_CLIENTE UNIQUE(TELEFONO);
ALTER TABLE CLIENTE ADD CONSTRAINT UK_CLIENTE UNIQUE(EMAIL);

ALTER TABLE DIRECTOR ADD CONSTRAINT CK_DIRECTOR CHECK(TELEFONO > 100000000 AND TELEFONO < 999999999);
ALTER TABLE VENDEDOR ADD CONSTRAINT CK_VENDEDOR CHECK(TELEFONO = );
ALTER TABLE CLIENTE ADD CONSTRAINT CK_CLIENTE CHECK(TELEFONO = );

ALTER TABLE PRODUCTO ADD CONSTRAINT UK_PRODUCTO UNIQUE(DESCRIPCION);

ALTER TABLE LINEAVENTA ADD CONSTRAINT CK_LINEAVENTA CHECK(RANGO > 1 AND RANGO < 99);