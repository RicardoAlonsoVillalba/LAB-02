-- Asegurar extensión pgcrypto
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- 1. Demostración insegura (Texto Claro)
DROP TABLE IF EXISTS usuarios_insegura;
CREATE TABLE usuarios_insegura (
    id BIGSERIAL PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL
);

INSERT INTO usuarios_insegura (usuario, password)
VALUES ('juan', 'Password123');

-- Consulta para verificar la falla de seguridad
SELECT * FROM usuarios_insegura;

-- 2. Demostración Segura (Hash con Sal / pgcrypto)
DROP TABLE IF EXISTS usuarios_segura;
CREATE TABLE usuarios_segura (
    id BIGSERIAL PRIMARY KEY,
    usuario VARCHAR(50) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL
);

-- Inserción con función crypt y gen_salt
INSERT INTO usuarios_segura (usuario, password_hash)
VALUES ('juan', crypt('Password123', gen_salt('bf')));

-- Consulta para verificar almacenamiento encriptado/hasheado
SELECT * FROM usuarios_segura;

-- Validación de contraseña correcta
SELECT usuario, password_hash = crypt('Password123', password_hash) AS contraseña_correcta 
FROM usuarios_segura WHERE usuario = 'juan';

-- Validación de contraseña incorrecta
SELECT usuario, password_hash = crypt('OtraPassword', password_hash) AS contraseña_correcta 
FROM usuarios_segura WHERE usuario = 'juan';
