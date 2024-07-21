-- id autoincrementable primary key
-- numero_cuenta text not null unico,
-- tipo_moneda SOLES | DOLARES | EUROS
-- fecha_creacion timestamp valor actual del servidor no nulo
-- mantenimiento float puede ser nulo

CREATE TYPE enum_tipo_moneda AS ENUM ('SOLES', 'DOLARES', 'EUROS');

CREATE TABLE cuentas (  
    id SERIAL PRIMARY KEY NOT NULL,
    numero_cuenta TEXT NOT NULL UNIQUE,
    tipo_moneda enum_tipo_moneda NOT NULL, 
    fecha_creacion TIMESTAMP default NOW(),
    mantenimiento FLOAT NULL,
    cliente_id INT NOT NULL,
    -- CREO LA RELACION ENTRE CUENTAS Y CLIENTES
    CONSTRAINT fk_clientes FOREIGN KEY(cliente_id) REFERENCES clientes(id)
);
