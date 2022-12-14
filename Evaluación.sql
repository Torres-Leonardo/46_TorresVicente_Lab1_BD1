CREATE DATABASE dbElectrodomesticos;

USE dbElectrodomesticos;

CREATE TABLE CLIENTE
(
CODCLI CHAR(4),
NOMCLI VARCHAR(60),
APECLI VARCHAR(80),
EMACLI VARCHAR(80),
CELCLI CHAR(9),
DIRCLI VARCHAR(70),
ESTCLO CHAR(1),
CONSTRAINT CODCLI_PK PRIMARY KEY (CODCLI)
);

CREATE TABLE VENDEDOR
(
CODVEND CHAR(4),
NOMVEND VARCHAR(60),
APEVEND VARCHAR(80),
EMAVEND VARCHAR(80),
CELVEND CHAR(9),
DIRVEND VARCHAR(70),
ESTVEND CHAR(1),
CONSTRAINT CODVEND_PK PRIMARY KEY (CODVEND)
);

CREATE TABLE PRODUCTO
(
CODPRO CHAR(5),
DESCPRO VARCHAR(80),
CATPRO CHAR(1),
PREPRO DECIMAL(8,2),
STOCKPRO INT,
ESTPRO CHAR(1),
CONSTRAINT CODPRO_PK PRIMARY KEY (CODPRO)
);

CREATE TABLE PROVEEDOR
(
CODPROV CHAR(5),
RAZSOCPROV VARCHAR(90),
RUCPROV VARCHAR(11),
EMAPROV VARCHAR(70),
ESTPROV CHAR(1),
CONSTRAINT CODPROV_PK PRIMARY KEY (CODPROV)
);

CREATE TABLE VENTA
(
CODVEN CHAR(5),
FECVEN DATETIME,
CODCLI CHAR(4),
CODVEND CHAR(4),
ESTVEN CHAR(1),
CONSTRAINT CODVEN_PK PRIMARY KEY (CODVEN)
);

ALTER TABLE VENTA
	ADD CONSTRAINT CODVEN_PK PRIMARY KEY (CODVEN);
ALTER TABLE VENTA 
	ADD CONSTRAINT CLIENTE_VENTA FOREIGN KEY (CODCLI)
    REFERENCES CLIENTE(CODCLI),
	ADD CONSTRAINT VENDEDOR_VENTA FOREIGN KEY (CODVEND)
    REFERENCES CLIENTE(COVEND);

CREATE TABLE VENTADETALLE
(
IDVENDET INT,
CODVEN CHAR(5),
CODPRO CHAR(5),
CANTPRO INT
);

ALTER TABLE VENTADETALLE
	ADD CONSTRAINT IDVENDET_PK PRIMARY KEY (IDVENDET);
ALTER TABLE VENTADETALLE 
	ADD CONSTRAINT PRODUCTO_VENTADETALLE FOREIGN KEY (CODPRO)
    REFERENCES PRODUCTO (CODPRO);
ALTER TABLE VENTADETALLE 
	ADD CONSTRAINT PRODUCTO_VENTADETALLE FOREIGN KEY (CODVEN)
    REFERENCES PRODUCTO (CODVEN);
    
CREATE TABLE COMPRA
(
CODCOM CHAR(5),
FECCOM DATETIME,
CODVEND CHAR(4),
CODPROV CHAR(5),
ESTCOM CHAR(1)
);

ALTER TABLE COMPRA
	ADD CONSTRAINT CODCOM_PK PRIMARY KEY (CODCOM);
ALTER TABLE COMPRA 
	ADD CONSTRAINT PROVEEDOR_COMPRA FOREIGN KEY (CODPROV)
    REFERENCES PROVEEDOR (CODPROV);

CREATE TABLE COMPRADETALLE
(
IDCOMDET INT,
CODCOM CHAR(5),
CODPRO CHAR(5),
CANTPRO INT
);
 ALTER TABLE COMPRADETALLE
	ADD CONSTRAINT IDCOMDET_PK PRIMARY KEY (IDCOMDET);
ALTER TABLE COMPRADETALLE
    ADD CONSTRAINT PRODUCTO_COMPRA_DETALLE FOREIGN KEY (CODPRO)
    REFERENCES PRODUCTO (CODPRO);