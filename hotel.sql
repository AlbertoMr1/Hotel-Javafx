SET NAMES 'utf8';
DROP DATABASE IF EXISTS hotel;
CREATE DATABASE IF NOT EXISTS hotel DEFAULT CHARACTER SET utf8;
USE hotel;

CREATE TABLE gerentes(
id_gre						INT NOT NULL AUTO_INCREMENT,
nombre						VARCHAR(20) NOT NULL,
apellido_paterno			VARCHAR(20) NOT NULL,
apellido_materno			VARCHAR(20) NOT NULL,
rfc							VARCHAR(13) NOT NULL,
correo						VARCHAR(40) BINARY UNIQUE,
telefono					VARCHAR(10) NOT NULL,
PRIMARY KEY(id_gre),
CONSTRAINT rango_correo_gerente CHECK (correo LIKE '%@%.%'),
CONSTRAINT apellido_paterno CHECK (REGEXP_LIKE(apellido_paterno,'[A-Z]')),
CONSTRAINT apellido_materno CHECK (REGEXP_LIKE(apellido_materno,'[A-Z]'))
)DEFAULT CHARACTER SET utf8;

CREATE TABLE hoteles(
id_htl						INT NOT NULL AUTO_INCREMENT,
nombre						VARCHAR(30) NOT NULL,
direccion					VARCHAR(100) NOT NULL,
correo						VARCHAR(40) BINARY UNIQUE,
telefono					VARCHAR(10) UNIQUE,
id_gre						INT NOT NULL,
PRIMARY KEY(id_htl),
CONSTRAINT rango_correo_hotel CHECK (correo LIKE '%@%.%'),
CONSTRAINT nombre CHECK (REGEXP_LIKE(nombre,'[A-Z]')),
FOREIGN KEY(id_gre)  REFERENCES gerentes(id_gre)
)DEFAULT CHARACTER SET utf8;

CREATE TABLE tipos(
id_tps						INT NOT NULL AUTO_INCREMENT,
tipo						VARCHAR(20) NOT NULL,
PRIMARY KEY(id_tps)
)DEFAULT CHARACTER SET utf8;
INSERT INTO tipos(tipo) VALUES('INDIVIDUAL');
INSERT INTO tipos(tipo) VALUES('MATRIMONIAL');
INSERT INTO tipos(tipo) VALUES('MIXTO');


CREATE TABLE habitaciones(
id_hbt						INT NOT NULL AUTO_INCREMENT,
numero						VARCHAR(20) NOT NULL,
costo						FLOAT(5,2) NOT NULL,
refrigerador				BOOLEAN NOT NULL DEFAULT FALSE,
id_tps						INT NOT NULL,
id_htl						INT NOT NULL,
PRIMARY KEY(id_hbt),
FOREIGN KEY(id_tps)  REFERENCES tipos(id_tps),
FOREIGN KEY(id_htl)  REFERENCES hoteles(id_htl)
)DEFAULT CHARACTER SET utf8;

insert into gerentes(nombre,apellido_paterno,apellido_materno,rfc,correo,telefono) values('G1','G1','G1','asdfghjklwert','demo.com@demo.com','1234456781');
insert into hoteles(nombre,direccion,correo,telefono,id_gre) values('H1','Demo','h1@demo.com','3424232525',1);
insert into habitaciones(numero,costo,refrigerador,id_tps,id_htl) values('A1',23.23,true,1,1);
