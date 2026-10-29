# Evidencia 07: Comparación entre protección en reposo y en tránsito

| Situación | Mecanismo apropiado | ¿Qué protege? |
| :--- | :--- | :--- |
| **Contraseña de usuario** | Hash con Sal / Derivación de Clave (`bcrypt`/`scrypt`/`Argon2`) | Protege la credencial contra filtración o lectura en reposo (Unidireccional). |
| **RFC almacenado en una tabla** | Cifrado Simétrico / Asimétrico (`pgp_sym_encrypt`) | Protege la confidencialidad del dato sensible en reposo (Reversible). |
| **Consulta enviada desde un cliente al servidor** | TLS (Transport Layer Security - `sslmode=verify-full`) | Protege los datos en tránsito contra intercepción y manipulación en la red. |
| **Respaldo de una base de datos** | Cifrado de Archivos / Cifrado de Respaldo (*Encryption at Rest*) | Protege los volúmenes y dumps de datos ante robos físicos o accesos a los respaldos. |
| **Clave criptográfica** | Almacén de Secretos / Gestor de Claves (*KMS / Vault*) | Protege las llaves maestras que permiten descifrar los datos en reposo. |
