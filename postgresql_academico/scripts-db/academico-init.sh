#!/bin/bash
set -e

# Crear la tabla y agregar datos
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<EOSQL
CREATE TABLE IF NOT EXISTS estudiantes (
  userid                      VARCHAR(50)  NOT NULL PRIMARY KEY,
  user_password               VARCHAR(100) NOT NULL,
  empno                       VARCHAR(32),
  jobcode                     INT,
  sede                        VARCHAR(50),
  modalidad_estudio           VARCHAR(50),
  academicprogrammeshortname  VARCHAR(50),
  academicprogrammename       VARCHAR(100),
  cardnumber                  VARCHAR(20),
  contractexpirydate          DATE,
  countryofresidence          VARCHAR(50),
  creation_date               DATE,
  dateofbirth                 DATE,
  email                       VARCHAR(100),
  email2                      VARCHAR(100),
  facultyshortname            VARCHAR(50),
  givenname                   VARCHAR(50),
  gender                      VARCHAR(10),
  surname                     VARCHAR(50),
  cityofresidence             VARCHAR(50),
  postaladdress               VARCHAR(200),
  provinceofresidence         VARCHAR(50),
  mobile                      VARCHAR(20),
  primaryaffiliation          VARCHAR(20),
  activationstatus        VARCHAR(50)
);

INSERT INTO estudiantes (
  userid, user_password, empno, jobcode, sede, modalidad_estudio,
  academicprogrammeshortname, academicprogrammename, cardnumber,
  contractexpirydate, countryofresidence, creation_date, dateofbirth,
  email, email2, facultyshortname, givenname, gender, surname,
  cityofresidence, postaladdress, provinceofresidence, mobile, primaryaffiliation, activationstatus
) VALUES
  ('micaela.ricaldi', 'Nena2018$', '515573', 17, 'Sede Lima', 'Presencial',
   'P27', 'EP Ingeniería de Sistemas', '322200011', '2023-05-31', 'Peru', '2023-08-17', '1993-06-01',
   'cesar.re24@upeu.edu.pe', 'cesar.re24@hotmail.com', 'FIA', 'MICAELA ANA', 'F', 'RICALDI MANDUJANO',
   'Lima', 'Los Sauces', 'Lima', '976284351', 'ESTUDI', 'Undefined'),

  ('cristian.huarcaya', 'Nena2018$', '11848', 228, 'Sede Lima', 'Presencial',
   'P51', 'Posgrado de Maestría en Auditoría', '201410595', '2023-07-31', 'Peru', '2023-02-02', '1994-11-22',
   'armando_dev@upeu.edu.pe', NULL, 'PG', 'Armando Cristian', 'M', 'Huarcaya Quilla',
   'Lima', 'Alameda ñaña A.H.', 'Lima', '983835274', 'ESTUDI', 'Undefined'),

  ('edwincq', 'Nena2018$', '8844', 18, 'Sede Lima', 'Presencial',
   'P25', 'EP Ingeniería Civil', '200910457', '2023-11-30', 'Peru', '2023-08-23', '1990-02-17',
   'edwincqu@gmail.com', 'edwincqu@gmail.com', 'FIA', 'EDWIN RENE', 'M', 'CALSIN QUINTO',
   'Lima', 'Bajada 5 Mz. H', 'Lima', '99999996', 'ESTUDI', 'E'),

  ('paulo.huaman', 'Nena2018$', '60665', 17, 'Sede Lima', 'Presencial',
   'P27', 'EP Ingeniería de Sistemas', '202010398', '2023-05-31', 'Peru', '2023-02-20', NULL,
   'pdhc3440@gmail.com', 'pdhc3440@gmail.com', 'FIA', 'Paulo David', 'M', 'Huaman Calderon',
   'Lima', 'Las colinas', 'Lima', '949191631', 'ESTUDI', 'D'),

  ('alejandro.lovato', 'Nena2018$', '197027', 17, 'Sede Lima', 'Presencial',
   'P27', 'EP Ingeniería de Sistemas', '202011688', '2023-05-31', 'Peru', '2023-02-17', NULL,
   'alejandro.lovato@colegiounion.edu.pe', 'alejandro.lovato@colegiounion.edu.pe', 'FIA', 'Alejandro', 'M', 'Lovato Huaman',
   'Lima', '-', 'Lima', '997927631', 'ESTUDI', 'E'),

  ('owenmejia', 'Nena2018$', '99655', 1, 'Sede Lima', 'Presencial',
   'P30', 'EP Medicina', '201611794', '2023-08-23', 'Peru', '2023-06-13', '1998-12-02',
   'owenmejia@upeu.edu.pe', 'owenmejia@upeu.edu.pe', 'FCS', 'Owen Miguelich', 'M', 'Mejia Guerra',
   'Lima', 'sss', 'Lima', '983835274', 'ESTUDI', 'D'),

  ('marlo', 'Nena2018$', '20145', 17, 'Sede Lima', 'Presencial',
   'P27', 'EP Ingeniería de Sistemas', '200110121', '2023-05-31', 'Peru', '2023-09-01', '1982-03-20',
   'wmarlo@upeu.edu.pe', 'wmarlo@upeu.edu.pe', 'FIA', 'WILDER', 'M', 'MARLO RIMARACHIN',
   'Lima', 'sssssssssss', 'Lima', '989597311', 'ESTUDI', 'D'),

  ('shianefarfan', 'Nena2018$', '50895', 2, 'Sede Lima', 'Presencial',
   'P31', 'EP Nutrición Humana', '201121101', '2023-08-05', 'Peru', '2023-08-18', NULL,
   'shiane.farfan@upeu.pe', 'shiane.farfan@upeu.pe', 'FCS', 'Shiane Lizceth', 'F', 'Farfan Vergara',
   'Lima', 'shiane.farfan@upeu.pe', 'Lima', '987051852', 'ESTUDI', 'D'),

  ('deibyjacobchavez', 'Nena2018$', '64030', 17, 'Sede Lima', 'Presencial',
   'P27', 'EP Ingeniería de Sistemas', '201810754', '2023-05-31', 'Peru', '2023-02-20', NULL,
   'alexgamexs@gmail.com', 'alexgamexs@gmail.com', 'FIA', 'Deibyjacob Javier', 'M', 'Chávez Garcia',
   'Lima', 'alexgamexs@gmail.com', 'Lima', '926597249', 'DOCEN', 'E'),

  ('sandra.flores', 'Nena2018$', '20919', 2, 'Sede Lima', 'Presencial',
   'P31', 'EP Nutrición Humana', '201321849', '2023-08-05', 'Peru', '2023-08-24', '1996-02-11',
   'sandraflores@upeu.edu.pe', 'sandraflores@upeu.edu.pe', 'FCS', 'Sandra Sadith', 'F', 'Flores Guillen',
   'Lima', 'sandraflores@upeu.edu.pe', 'Lima', '969332644', 'ESTUDI', 'E'),

  ('naoki.san', 'Nena2018$', '777777', 17, 'Sede Lima', 'Presencial',
   'P27', 'EP Ingeniería de Sistemas', '202333333', '2023-12-29', 'Peru', '2023-08-23', '1996-02-12',
   'naoki.san@upeu.edu.pe', 'naoki.san@upeu.edu.pe', 'FIA', 'Naoki', 'F', 'San',
   'Lima', 'La Era', 'Lima', '994736273', 'ESTUDI', 'E');

COMMIT; -- Confirmar la transacción
EOSQL
