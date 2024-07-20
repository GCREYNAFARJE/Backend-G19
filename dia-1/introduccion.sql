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


INSERT INTO "alumnos" (nombre, "apellidos", correo, "matriculado", fecha_nacimiento) VALUES
                      ('segundo', 'Alvarez', 'salvarez@gmail.com', true, '1995-09-18'),
                      ('Renzo', 'soles Contreras', 'rsoles@hotmail.com', false, '2000-02-14'),
                      ('Abel', 'Guevara', 'aguevara@yahoo.es', true, '1989-10-08'),
                      ('Rodrigo', 'Trujillo', 'iestremadoyro@hotmail.com', true, '1998-06-17'),
                      ('Ignacio', 'Estremadoyro Lam', 'stremadoyro@hotmail.com', true, '1990-06-17');


--Si en un update no ponemos la condicional, esta modificacion se hara a TODOS los registros!
-- Actualizame todos los alumnos su fecha_nacimiento al 1996-06-17 DONDE nombre sea Abel y el apellidos sea Guevara
-- Para actualizar más de una columna se utiliza la coma, el AND u OR SOLAMENTE va en condicionales (WHERE)
UPDATE "alumnos" SET "fecha_nacimiento" = '1995-06-20', matriculado = false
WHERE nombre = 'Abel' AND apellidos = 'Guevara';

-- Elimina de manera permanente los registros en la base de datos 
DELETE FROM "alumnos" WHERE nombre = 'Shrek';


-- Si queremos hacer una serie de pasos (o un paso) que se puedan revertir debemos utilizar una transaccion
BEGIN; -- Empezamos la transaccion
DELETE FROM "alumnos" WHERE nombre = 'Eduardo';
-- O bien se usa rollback o bien se usa commit
ROLLBACK; -- Si queremos cancelar todos los cambios en la transaccion
COMMIT;-- Se guardaran los cambios de manera permanente y ahora si de manera irreversible en la bd




 BEGIN;
 DELETE FROM alumnos WHERE nombre ='Giancarlo';
 SAVEPOINT punto_de_guardado; --Agrego un punto de guardado en el caso quisiera retroceder hasta este momento
 UPDATE alumnos SET nombre = 'Roxana' WHERE nombre = 'Ignacio'; -- Modificacion del nombre de un alumno
 ROLLBACK TO punto_de_guardado; -- No! No era ese nombre y no quiero guardar los cambios, entonces retrocedo hasta el punto de guardado
 UPDATE alumnos SET nombre = 'Ignacio' WHERE nombre = 'Ignacion';-- Realizo la modificacion correcta del nombre del alumno
 COMMIT; -- Escritura permanente de los cambios en la base de datos




 -- SELECT 
 -- Visualizar la información que esta almacenada en la base de datos 
SELECT id, nombre FROM alumnos;

SELECT * FROM alumnos;

-- Agregar filtros 
SELECT * FROM alumnos WHERE nombre = 'Abel';

SELECT * FROM alumnos WHERE nombre = 'Abel'; AND matriculado = true;


-- Devolver los nombres y fecha_nacimiento de los alumnos que se llamen Abel o Renzo o que no esten matriculados
--SOLUCION DE EJERCICIO
SELECT nombre, fecha_nacimiento FROM alumnos;
 SELECT nombre, fecha_nacimiento FROM alumnos WHERE (nombre = 'Renzo' OR nombre = 'Abel') AND matriculado = false;

--Busqueda por una similitud
SELECT * FROM alumnos WHERE nombre like '%a%';
 SELECT * FROM alumnos WHERE nombre ilike '%a%';

-- Si queremos buscar un caracter en una determinada posicion
SELECT * FROM alumnos WHERE nombre ilike '___a%';

-- condicionales tambien se puede buscar con menor que, menor o igual que, mayor que, o mayor o igual que 
SELECT * FROM alumnos WHERE id >=3;

--Devolver todos los alumnos cuyo nombre tenga la letra 'o' o la letra 'a' y que su fecha de nacimiento sea mayor a 1995-01-01
SELECT * FROM alumnos WHERE nombre ilike '%o%' OR nombre ilike '%a%' AND fecha_nacimiento > '1995-01-01';

-- 'Abel' | 'Ignacio' | 'Rodrigo'
SELECT * FROM alumnos WHERE nombre IN ('Abel', 'Ignacio','Rodrigo');

-- Ordenamiento 
SELECT * FROM alumnos ORDER BY nombre ASC;
SELECT * FROM alumnos ORDER BY nombre DESC;

--Paginacion
--LIMIT >
SELECT * FROM alumnos LIMIT 2 OFFSET 2;
