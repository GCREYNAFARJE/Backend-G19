-- Esta es la forma de escribir comentarios en la bd
-- DDL (Data definition lenguaje) Crear una nueva base de datos en el servidor 
CREATE DATABASE pruebas;

-- Se recomienda que el nombre sea pluralizado porque se guardan varios registros de esa tabla
CREATE TABLE alumnos(
    -- nombre de la columna y el tipo de dato
    -- constraint columns: PRIMARY KEY | NOT NULL | UNIQUE | FOREIGN ... | REFERENCES
    id SERIAL NOT NULL PRIMARY KEY,
    nombre TEXT NOT NULL,
    apellidos TEXT NULL, -- SU VALOR POR DEFECTO DE UNA COLUMMNA ES NULL
    correo TEXT NOT NULL UNIQUE, --El correo va ser unico y no repetible
    matriculado BOOLEAN DEFAULT true, -- Indicamos un valor por defecto en el caso no se ingrese
    fecha_nacimiento DATE NULL -- En la ultima columna no se coloca la coma ya que no hay otra columna
);

DROP TABLE alumnos; -- Eliminamos de manera definitiva la tabla de la base de datos

-- DML (Data Manipulation Languaje) Todo lo relacionado a como se puede manejar los datos en la base de datos 

INSERT INTO alumnos(id, nombre, apellidos, correo, matriculado, fecha_nacimiento) VALUES
                (DEFAULT, 'Giancarlo', 'Reynafarje', 'gcreynafarje@gmail.com', true, '1991-11-23');