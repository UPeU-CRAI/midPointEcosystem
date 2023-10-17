#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
-- Creación de la tabla "estudiantes"
CREATE TABLE estudiantes (
	userid varchar(50) NOT NULL,
	empno int4 NOT NULL,
	jobcode int4 NULL,
	sede varchar(50) NULL,
	modalidad_estudio varchar(50) NULL,
	academicprogrammeshortname varchar(50) NULL,
	academicprogrammename varchar(100) NULL,
	cardnumber varchar(20) NULL,
	contractexpirydate date NULL,
	countryofresidence varchar(50) NULL,
	creation_date date NULL,
	dateofbirth date NULL,
	email varchar(100) NULL,
	email2 varchar(100) NULL,
	facultyshortname varchar(50) NULL,
	givennane varchar(50) NULL,
	gender varchar(10) NULL,
	surname varchar(50) NULL,
	cityofresidence varchar(50) NULL,
	postaladdress varchar(200) NULL,
	provinceofresidence varchar(50) NULL,
	mobile varchar(20) NULL,
	"password" varchar(100) NULL,
	primaryaffiliation varchar(20) NULL
);
INSERT INTO estudiantes (userid,empno,jobcode,sede,modalidad_estudio,academicprogrammeshortname,academicprogrammename,cardnumber,contractexpirydate,countryofresidence,creation_date,dateofbirth,email,email2,facultyshortname,givennane,gender,surname,cityofresidence,postaladdress,provinceofresidence,mobile,"password",primaryaffiliation) VALUES
	 ('micaela.ricaldi',515573,17,'Sede Lima','Presencial','P27','EP Ingeniería de Sistemas','322200011','2023-05-31','Peru','2023-08-17','1993-06-01','cesar.re24@upeu.edu.pe','cesar.re24@hotmail.com','FIA','MICAELA ANA','F','RICALDI MANDUJANO','Lima','Los Sauces','Lima','976284351','sha149565d25d61eaa4330531206e375c615ff0fa55779','ESTUDI'),
	 ('cristian.huarcaya',11848,228,'Sede Lima','Presencial','P51','Posgrado de Maestría en Auditoría Mención: Auditoría Integral','201410595','2023-07-31','Peru','2023-02-02','1994-11-22','armando_dev@upeu.edu.pe',NULL,'PG','Armando Cristian','M','Huarcaya Quilla','Lima','Alameda ñaña A.H. a ','Lima','983835274','y0.EXTWDJzLZ32Pq1hA0hmOF.','ESTUDI'),
	 ('edwincq',8844,18,'Sede Lima','Presencial','P25','EP Ingeniería Civil','200910457','2023-11-30','Peru','2023-08-23','1990-02-17',NULL,'edwincqu@gmail.com','FIA','EDWIN RENE','M','CALSIN QUINTO','Lima','Bajada 5 Mz. H Lte. 11 Dpto. 3 Int. 2 Cas. abv','Lima','99999996','y0/SNhoI6KaRs9nOmiwoeGbdUFg00IBJcymFDr1WdVkNCyW','ESTUDI'),
	 ('paulo.huaman',60665,17,'Sede Lima','Presencial','P27','EP Ingeniería de Sistemas','202010398','2023-05-31','Peru','2023-02-20',NULL,NULL,'pdhc3440@gmail.com','FIA','Paulo David','M','Huaman Calderon','Lima','Las colinas','Lima','949191631','sha1493ca413e61535cf2017496b87412aa332072053f8','ESTUDI'),
	 ('alejandro.lovato',197027,17,'Sede Lima','Presencial','P27','EP Ingeniería de Sistemas','202011688','2023-05-31','Peru','2023-02-17',NULL,NULL,'alejandro.lovato@colegiounion.edu.pe','FIA','Alejandro','M','Lovato Huaman','Lima','-','Lima','997927631','sha1493ca413e61535cf2017496b87412aa332072053f8','ESTUDI'),
	 ('owenmejia',99655,1,'Sede Lima','Presencial','P30','EP Medicina','201611794','2023-08-23','Peru','2023-06-13','1998-12-02','owenmejia@upeu.edu.pe',NULL,'FCS','Owen Miguelich','M','Mejia Guerra','Lima','sss','Lima','983835274','sha1493203f00393c8519829e84d9f341b421a7bf2db34','ESTUDI'),
	 ('marlo',20145,17,'Sede Lima','Presencial','P27','EP Ingeniería de Sistemas','200110121','2023-05-31','Peru','2023-09-01','1982-03-20','wmarlo@upeu.edu.pe',NULL,'FIA','WILDER','M','MARLO RIMARACHIN','Lima','sssssssssss','Lima','989597311','y0//lllMfmNKIdPSoj3MUKXl2','ESTUDI'),
	 ('shianefarfan',50895,2,'Sede Lima','Presencial','P31','EP Nutrición Humana','201121101','2023-08-05','Peru','2023-08-18',NULL,'shiane.farfan@upeu.pe',NULL,'FCS','Shiane Lizceth','F','Farfan Vergara','Lima',NULL,'Lima','987051852','sha1497ae5c37e05610c8481c74da703e9634eca330117','ESTUDI'),
	 ('deibyjacobchavez',64030,17,'Sede Lima','Presencial','P27','EP Ingeniería de Sistemas','201810754','2023-05-31','Peru','2023-02-20',NULL,NULL,'alexgamexs@gmail.com','FIA','Deibyjacob Javier','M','Chávez Garcia','Lima',NULL,'Lima','926597249','sha149163ee78cf5e48773a708706e2005e9202067ddf5','DOCEN'),
	 ('sandra.flores',20919,2,'Sede Lima','Presencial','P31','EP Nutrición Humana','201321849','2023-08-05','Peru','2023-08-24','1996-02-11','sandraflores@upeu.edu.pe','sandraflores@hotmail.com','FCS','Sandra Sadith','M','Flores Guillen','Lima',NULL,'Lima','969332644','password','ESTUDI'),
	 ('naoki.san',777777,17,'Sede Lima','Presencial','P27','EP Ingeniería de Sistemas','202333333','2023-12-29','Peru','2023-08-23','1996-02-12','naoki.san@upeu.edu.pe','naoki.san@gmail.com','FIA','Naoki','F','San','Lima','La Era','Lima','994736273','cGFzc3dvcmQ=','ESTUDI');

COMMIT; -- Confirmar la transacción

EOSQL