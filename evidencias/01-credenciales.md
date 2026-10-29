# Evidencia 01: Protección de credenciales

## Objetivo
Analizar los riesgos de almacenar contraseñas en texto claro e implementar representaciones no reversibles mediante derivación de claves en PostgreSQL.

## Procedimiento
1. Creación de tabla `usuarios_insegura` con campo `password` en texto claro.
2. Inserción de prueba y verificación con `SELECT`.
3. Prueba del algoritmo `crypt()` junto con `gen_salt('bf')` utilizando la extensión `pgcrypto`.
4. Creación de tabla `usuarios_segura` con `password_hash`.
5. Ejecución de pruebas de validación con credenciales correctas e incorrectas.

## Resultados Obtenidos
- En `usuarios_insegura`, la contraseña `'Password123'` se almacenó e imprimió visiblemente.
- Al ejecutar `crypt('Password123', gen_salt('bf'))` en múltiples ocasiones, los hashes producidos son **diferentes** en cada intento debido a la adición de la sal aleatoria (`salt`).
- La validación con la clave correcta retornó `true` y la clave incorrecta retornó `false`.

## Respuestas al cuestionario técnico
1. **¿Qué ocurriría si una persona obtiene acceso de lectura a la tabla insegura?**  
   Obtiene de forma inmediata las contraseñas reales de los usuarios, comprometiendo sus cuentas en el sistema y en otras plataformas por reutilización de credenciales.
2. **¿Son iguales los resultados al ejecutar `crypt` consecutivamente?**  
   No. Cada llamada genera una sal única.
3. **¿Qué función cumple `gen_salt()`?**  
   Genera una cadena aleatoria (*salt*) para combinarla con la contraseña antes de aplicar el algoritmo de derivación, asegurando que dos contraseñas idénticas produzcan hashes distintos y evitando ataques por tablas precalculadas (*Rainbow Tables*).
4. **¿Qué función cumple `crypt()`?**  
   Aplica un algoritmo de hashing criptográfico (Blowfish/Bcrypt) junto con la sal para producir el hash de la credencial.
5. **¿Esto es cifrado reversible?**  
   No. Es una transformación unidireccional (*one-way hash*) no reversible.

## Conclusión
Las contraseñas no deben ser cifradas ni almacenadas en texto claro; deben ser protegidas mediante funciones de derivación con sal no reversibles.
