#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL

-- Crear la tabla de estudiantes
CREATE TABLE estudiantes (
  estudiante_id SERIAL PRIMARY KEY,
  Academic_Programme_Short_Name VARCHAR(10),
  card_number VARCHAR(20),
  contract_expiry_date DATE,
  country VARCHAR(50),
  creation_date DATE,
  date_of_birth DATE,
  email VARCHAR(100),
  emailpro VARCHAR(100),
  faculty_Short_Name VARCHAR(10),
  first_name VARCHAR(50),
  gender CHAR(1),
  last_name VARCHAR(50),
  locality VARCHAR(50),
  nickname VARCHAR(50),
  postal_address VARCHAR(100),
  postal_code VARCHAR(10),
  region VARCHAR(50),
  telephone_number VARCHAR(20),
  username VARCHAR(100),
  password VARCHAR(16) -- Agregamos el atributo "password"
);

-- Insertar algunos datos de ejemplo en la tabla de estudiantes
INSERT INTO estudiantes (Academic_Programme_Short_Name, card_number, contract_expiry_date, country, creation_date, date_of_birth, email, emailpro, faculty_Short_Name, first_name, gender, last_name, locality, nickname, postal_address, postal_code, region, telephone_number, username, password)
VALUES
  ('P27', '20180001', '2024-12-31', 'Perú', '2020-09-01', '1998-02-20', 'luis.martinez@upeu.edu.pe', 'luis.martinez@gmail.com', 'FIA', 'Luis', 'M', 'Martínez', 'Lima', 'Lucho', 'Calle Los Pinos 123', '15464', 'Lima', '+51 987 654 321', 'luis.martinez', 'Jenny123'),
  ('P27', '20190002', '2023-12-31', 'Perú', '2019-08-15', '1999-05-10', 'ana.gomez@upeu.edu.pe', 'ana.gomez@gmail.com', 'FIA', 'Ana', 'F', 'Gómez', 'Lima', 'Anita', 'Av. Las Flores 456', '15464', 'Lima', '+51 999 123 456', 'ana.gomez', 'IwillHAVEorder'),
  ('P27', '20200003', '2025-12-31', 'Perú', '2020-09-15', '2000-09-15', 'pedro.soto@upeu.edu.pe', 'pedro.soto@gmail.com', 'FIA', 'Pedro', 'M', 'Soto', 'Lima', 'Pete', 'Jr. Los Pájaros 789', '15464', 'Lima', '+51 987 789 123', 'pedro.soto', 'L0st in Spac3'),
  ('P27', '20210004', '2024-12-31', 'Perú', '2021-01-10', '2001-11-30', 'laura.hernandez@upeu.edu.pe', 'laura.hernandez@gmail.com', 'FIA', 'Laura', 'F', 'Hernández', 'Lima', 'Laurita', 'Calle Los Cerezos 101', '15464', 'Lima', '+51 998 567 890', 'laura.hernandez', '!GOTCHA'),
  ('P27', '20220005', '2026-12-31', 'Perú', '2022-03-15', '2002-07-05', 'carla.rojas@upeu.edu.pe', 'carla.rojas@gmail.com', 'FIA', 'Carla', 'F', 'Rojas', 'Lima', 'Carly', 'Av. Los Laureles 789', '15464', 'Lima', '+51 987 987 654', 'carla.rojas', 'Pa$$w0rd'),
  ('P27', '20230006', '2027-12-31', 'Perú', '2023-02-20', '2003-09-12', 'diego.fernandez@upeu.edu.pe', 'diego.fernandez@gmail.com', 'FIA', 'Diego', 'M', 'Fernández', 'Lima', 'Dieguito', 'Jr. Las Palmas 456', '15464', 'Lima', '+51 999 789 123', 'diego.fernandez', 'S3cur3Pass'),
  ('P27', '20240007', '2028-12-31', 'Perú', '2024-05-10', '2004-01-30', 'valeria.gomez@upeu.edu.pe', 'valeria.gomez@gmail.com', 'FIA', 'Valeria', 'F', 'Gómez', 'Lima', 'Vale', 'Calle Los Cedros 789', '15464', 'Lima', '+51 987 456 789', 'valeria.gomez', 'MyP@ssword'),
  ('P27', '20250008', '2029-12-31', 'Perú', '2025-08-08', '2005-04-18', 'javier.lopez@upeu.edu.pe', 'javier.lopez@gmail.com', 'FIA', 'Javier', 'M', 'López', 'Lima', 'Javi', 'Av. Los Pájaros 101', '15464', 'Lima', '+51 999 654 321', 'javier.lopez', 'Un1v3rs1ty');

-- Puedes agregar más datos de ejemplo si es necesario

EOSQL