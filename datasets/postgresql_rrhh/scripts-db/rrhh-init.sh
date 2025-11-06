#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL

-- Crear la tabla de empleados de la universidad
CREATE TABLE empleados (
  empleado_id SERIAL PRIMARY KEY,
  nombres VARCHAR(100),
  apellidos VARCHAR(100),
  documento_identidad VARCHAR(20),
  correo_electronico VARCHAR(100),
  fecha_nacimiento DATE,
  salario NUMERIC(10, 2),
  cargo VARCHAR(50),
  lugar_de_trabajo VARCHAR(100),
  activo BOOLEAN
);

-- Insertar algunos datos de ejemplo en la tabla de empleados
INSERT INTO empleados (nombres, apellidos, documento_identidad, correo_electronico, fecha_nacimiento, salario, cargo, lugar_de_trabajo, activo)
VALUES
  ('Juan', 'Perez', 'DNI12345678', 'juan.perez@upeu.edu.pe', '1985-03-15', 55000.00, 'Profesor', 'Edificio A', TRUE),
  ('María', 'González', 'DNI87654321', 'maria.gonzalez@upeu.edu.pe', '1990-12-10', 60000.00, 'Administrativo', 'Oficina Principal', TRUE),
  ('Carlos', 'Sánchez', 'DNI78901234', 'carlos.sanchez@upeu.edu.pe', '1988-09-25', 62000.00, 'Profesor', 'Edificio B', TRUE),
  ('Ana', 'López', 'DNI56789012', 'ana.lopez@upeu.edu.pe', '1995-06-30', 58000.00, 'Administrativo', 'Edificio C', TRUE);

-- Puedes agregar más datos de ejemplo si es necesario

EOSQL