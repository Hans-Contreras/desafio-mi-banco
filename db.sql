-- Crear una base de datos llamada banco
CREATE DATABASE banco;

-- Conexión a database banco
\c banco

-- Crear una tabla cuentas
CREATE TABLE cuentas (
    id INT PRIMARY KEY,
    saldo DECIMAL CHECK (saldo >= 0)
    );

-- Crear Tabla transacciones
CREATE TABLE transacciones (
    id SERIAL PRIMARY KEY,
    cuenta INT REFERENCES cuentas(id),
    monto DECIMAL,
    descripcion varchar(50), 
    fecha varchar(10)
    );


-- Iserciones de datos a tabla de cuentas
INSERT INTO cuentas values (1, 10000);
INSERT INTO cuentas values (2, 20000);
INSERT INTO cuentas values (3, 30000);

-- Selección de tablas
SELECT * FROM cuentas ORDER BY id ASC;
SELECT * FROM transacciones;

-- Ejemplo de ingreso comando transacciones
node index.js nuevo 1 5000 'Transferencia de Juan Perez a María Juana' '20/03/2022' 3
node index.js depositar 2 6000 'Depósito 001' '21/03/2022'
node index.js retirar 2 3000 'Retiro 001' '21/03/2022'
node index.js consulta 2
node index.js id 2

