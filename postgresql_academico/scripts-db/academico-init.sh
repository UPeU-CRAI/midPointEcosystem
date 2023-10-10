#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
-- Creación de la tabla "estudiantes"
CREATE TABLE estudiantes (
    USERID VARCHAR(50),
    empno INTEGER,
    jobcode INTEGER,
    SEDE VARCHAR(50),
    MODALIDAD_ESTUDIO VARCHAR(50),
    PROGRAM_SHORT_NAME VARCHAR(50),
    PROGRAM_NAME VARCHAR(100),
    CARD_NUMBER VARCHAR(20),
    CONTRACT_EXPIRY_DATE DATE,
    COUNTRY VARCHAR(50),
    CREATION_DATE DATE,
    DATE_OF_BIRTH DATE,
    EMAIL VARCHAR(100),
    EMAILPRO VARCHAR(100),
    SIGLA_FACULTAD VARCHAR(50),
    FIRST_NAME VARCHAR(50),
    GENDER VARCHAR(10),
    LAST_NAME VARCHAR(50),
    LOCALITY VARCHAR(50),
    POSTAL_ADDRESS VARCHAR(200),
    REGION VARCHAR(50),
    TELEPHONE_NUMBER VARCHAR(20),
    PASSWORD VARCHAR(100)
);

-- Inserción de datos en la tabla "estudiantes"
INSERT INTO estudiantes (
    USERID,
    empno,
    jobcode,
    SEDE,
    MODALIDAD_ESTUDIO,
    PROGRAM_SHORT_NAME,
    PROGRAM_NAME,
    CARD_NUMBER,
    CONTRACT_EXPIRY_DATE,
    COUNTRY,
    CREATION_DATE,
    DATE_OF_BIRTH,
    EMAIL,
    EMAILPRO,
    SIGLA_FACULTAD,
    FIRST_NAME,
    GENDER,
    LAST_NAME,
    LOCALITY,
    POSTAL_ADDRESS,
    REGION,
    TELEPHONE_NUMBER,
    PASSWORD
) VALUES 
('edwincq',8844,18,'Sede Lima','Presencial','P25','EP Ingeniería Civil','200910457','2023-11-30','Peru','2023-08-23','1990-02-17','edwincqu@gmail.com',NULL,'FIA','EDWIN RENE','Varon','CALSIN QUINTO','Sede Lima','Bajada 5 Mz. H Lte. 11 Dpto. 3 Int. 2 Cas. abv','Lima','99999996','$2y$10$TithsUzv/SNhoI6KaRs9nOmiwoeGbdUFg00IBJcymFDr1WdVkNCyW'),
('edwincq',8844,2,'Sede Lima','Presencial','P31','EP Nutrición Humana','200910457','2023-08-05','Peru','2023-08-23','1990-02-17','edwincqu@gmail.com',NULL,'FCS','EDWIN RENE','Varon','CALSIN QUINTO','Sede Lima','Bajada 5 Mz. H Lte. 11 Dpto. 3 Int. 2 Cas. abv','Lima','99999996','$2y$10$TithsUzv/SNhoI6KaRs9nOmiwoeGbdUFg00IBJcymFDr1WdVkNCyW'),
('jhonatan.esquivel',72715,17,'Sede Lima','Presencial','P27','EP Ingeniería de Sistemas','202011154','2023-05-31','Peru','2023-02-20',NULL,'jhona_ta_tan@hotmail.com',NULL,'FIA','Jhonatan Raul','Varon','Esquivel Godoy','Sede Lima',NULL,'Lima','951418739','sha1$$3ca413e61535cf2017496b87412aa332072053f8'),
('paulo.huaman',60665,17,'Sede Lima','Presencial','P27','EP Ingeniería de Sistemas','202010398','2023-05-31','Peru','2023-02-20',NULL,'pdhc3440@gmail.com',NULL,'FIA','Paulo David','Varon','Huaman Calderon','Sede Lima',NULL,'Lima','949191631','sha1$$3ca413e61535cf2017496b87412aa332072053f8'),
('alejandro.lovato',197027,17,'Sede Lima','Presencial','P27','EP Ingeniería de Sistemas','202011688','2023-05-31','Peru','2023-02-17',NULL,'alejandro.lovato@colegiounion.edu.pe',NULL,'FIA','Alejandro','Varon','Lovato Huaman','Sede Lima','-','Lima','997927631','sha1$$3ca413e61535cf2017496b87412aa332072053f8'),
('owenmejia',99655,1,'Sede Lima','Presencial','P30','EP Medicina','201611794','2023-08-23','Peru','2023-06-13','1998-12-02','owenmejia@upeu.edu.pe',NULL,'FCS','Owen Miguelich','Varon','Mejia Guerra','Sede Lima','sss','Lima','983835274','sha1$$3203f00393c8519829e84d9f341b421a7bf2db34'),
('owenmejia',99655,1,'Sede Lima','Presencial','P30','EP Medicina','201611794','2023-08-23','Peru','2023-06-16','1998-12-02','owenmejia@upeu.edu.pe',NULL,'FCS','Owen Miguelich','Varon','Mejia Guerra','Sede Lima','sss','Lima','983835274','sha1$$3203f00393c8519829e84d9f341b421a7bf2db34'),
('marlo',20145,2,'Sede Lima','Presencial','P31','EP Nutrición Humana','200110121','2023-08-05','Peru','2023-08-10','1982-03-20','wmarlo@upeu.edu.pe',NULL,'FCS','WILDER','Varon','MARLO RIMARACHIN','Sede Lima','sssssssssss','Lima','989597311','$2y$10$mN0pQAfmkkgQcHSQRIpDBuH7Kn9uUI//lllMfmNKIdPSoj3MUKXl2'),
('marlo',20145,17,'Sede Lima','Presencial','P27','EP Ingeniería de Sistemas','200110121','2023-05-31','Peru','2023-07-31','1982-03-20','wmarlo@upeu.edu.pe',NULL,'FIA','WILDER','Varon','MARLO RIMARACHIN','Sede Lima','sssssssssss','Lima','989597311','$2y$10$mN0pQAfmkkgQcHSQRIpDBuH7Kn9uUI//lllMfmNKIdPSoj3MUKXl2'),
('marlo',20145,1,'Sede Lima','Presencial','P30','EP Medicina','200110121','2023-08-23','Peru','2023-07-31','1982-03-20','wmarlo@upeu.edu.pe',NULL,'FCS','WILDER','Varon','MARLO RIMARACHIN','Sede Lima','sssssssssss','Lima','989597311','$2y$10$mN0pQAfmkkgQcHSQRIpDBuH7Kn9uUI//lllMfmNKIdPSoj3MUKXl2'),
('marlo',20145,2,'Sede Lima','Presencial','P31','EP Nutrición Humana','200110121','2023-08-05','Peru','2023-08-10','1982-03-20','wmarlo@upeu.edu.pe',NULL,'FCS','WILDER','Varon','MARLO RIMARACHIN','Sede Lima','sssssssssss','Lima','989597311','$2y$10$mN0pQAfmkkgQcHSQRIpDBuH7Kn9uUI//lllMfmNKIdPSoj3MUKXl2'),
('marlo',20145,17,'Sede Lima','Presencial','P27','EP Ingeniería de Sistemas','200110121','2023-05-31','Peru','2023-09-01','1982-03-20','wmarlo@upeu.edu.pe',NULL,'FIA','WILDER','Varon','MARLO RIMARACHIN','Sede Lima','sssssssssss','Lima','989597311','$2y$10$mN0pQAfmkkgQcHSQRIpDBuH7Kn9uUI//lllMfmNKIdPSoj3MUKXl2'),
('cristian.huarcaya',11848,228,'Sede Lima','Presencial','P51','Posgrado de Maestría en Auditoría Mención: Auditoría Integral','201410595','2023-07-31','Peru','2023-02-02','1994-11-22','armando_dev@upeu.edu.pe',NULL,'EPG','Armando Cristian','Varon','Huarcaya Quilla','Sede Lima','Alameda ñaña A.H. a ','Lima','983835274','$2y$10$RVkMXtsR0sig5IpSaHlhquwmD3wo9K.EXTWDJzLZ32Pq1hA0hmOF.'),
('shianefarfan',50895,18,'Sede Lima','Presencial','P25','EP Ingeniería Civil','201121101','2023-11-30','Peru','2023-08-18',NULL,'shiane.farfan@upeu.pe',NULL,'FIA','Shiane Lizceth','Mujer','Farfan Vergara','Sede Lima',NULL,'Lima','987051852','sha1$$7ae5c37e05610c8481c74da703e9634eca330117'),
('shianefarfan',50895,2,'Sede Lima','Presencial','P31','EP Nutrición Humana','201121101','2023-08-05','Peru','2023-08-18',NULL,'shiane.farfan@upeu.pe',NULL,'FCS','Shiane Lizceth','Mujer','Farfan Vergara','Sede Lima',NULL,'Lima','987051852','sha1$$7ae5c37e05610c8481c74da703e9634eca330117'),
('sandra.flores',20919,2,'Sede Lima','Presencial','P31','EP Nutrición Humana','201321849','2023-08-05','Peru','2023-08-24','1996-02-11','sandraflores@upeu.edu.pe',NULL,'FCS','Sandra Sadith','Varon','Flores Guillen','Sede Lima',NULL,'Lima','969332644','$2y$10$Rkh5yK3FmYgnFDwAZXQAaevnJSXvromftj3Kvp9XUSYJeNJ2kq4EW'),
('deibyjacobchavez',64030,17,'Sede Lima','Presencial','P27','EP Ingeniería de Sistemas','201810754','2023-05-31','Peru','2023-02-20',NULL,'alexgamexs@gmail.com',NULL,'FIA','Deibyjacob Javier','Varon','Chávez Garcia','Sede Lima',NULL,'Lima','926597249','sha1$$163ee78cf5e48773a708706e2005e9202067ddf5'),
('micaela.ricaldi',515573,17,'Sede Lima','Presencial','P27','EP Ingeniería de Sistemas','322200011','2023-05-31',NULL,'2023-08-17','1993-06-01','cesar.re24@hotmail.com',NULL,'FIA','MICAELA ANA','Mujer','RICALDI MANDUJANO','Sede Lima',NULL,'Lima','976284351','sha1$$565d25d61eaa4330531206e375c615ff0fa55779');

COMMIT; -- Confirmar la transacción

EOSQL