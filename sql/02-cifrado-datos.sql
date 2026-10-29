-- Asegurar extensión pgcrypto
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Crear tabla para cifrado simétrico
DROP TABLE IF EXISTS clientes_protegidos;
CREATE TABLE clientes_protegidos (
    id BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    rfc_cifrado BYTEA NOT NULL
);

-- Inserción con cifrado PGP simétrico
INSERT INTO clientes_protegidos (nombre, rfc_cifrado) 
VALUES ('Ana López', pgp_sym_encrypt('LOPA900101ABC', 'CLAVE-DE-PRUEBA'));

-- Consulta de datos cifrados (texto binario/BYTEA)
SELECT * FROM clientes_protegidos;

-- Descifrado autorizado utilizando la clave simétrica
SELECT id, nombre, pgp_sym_decrypt(rfc_cifrado, 'CLAVE-DE-PRUEBA') AS rfc
FROM clientes_protegidos;
