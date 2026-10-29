# Evidencia 02: Cifrado de información sensible

## Objetivo
Implementar cifrado simétrico en columnas de bases de datos para proteger atributos que deben poder recuperarse en texto claro bajo necesidades legítimas.

## Procedimiento
1. Creación de la tabla `clientes_protegidos` almacenando el dato en una columna tipo `BYTEA`.
2. Cifrado con `pgp_sym_encrypt('LOPA900101ABC', 'CLAVE-DE-PRUEBA')`.
3. Consulta directa del contenido de la tabla.
4. Lectura y descifrado controlado mediante `pgp_sym_decrypt()`.

## Resultados Obtenidos
- El campo `rfc_cifrado` almacena un arreglo binario no interpretable a simple vista.
- Aplicando `pgp_sym_decrypt` con la clave correcta, se recuperó la cadena original `'LOPA900101ABC'`.

## Respuestas al cuestionario técnico
1. **¿Qué diferencia existe entre `crypt()` y `pgp_sym_encrypt()`?**  
   `crypt()` es un algoritmo hash unidireccional (irreversible) diseñado para contraseñas, mientras que `pgp_sym_encrypt()` es cifrado bidireccional (reversible) que permite recuperar el dato original con la clave adecuada.
2. **¿Cuál permite recuperar el dato original?**  
   `pgp_sym_encrypt()`.
3. **¿Qué ocurre si se utiliza una clave incorrecta?**  
   PostgreSQL arroja un error de descifrado (*Wrong key or corrupt data*) y bloquea el acceso a la lectura.
4. **¿Qué problema de seguridad representa colocar la clave directamente en una consulta?**  
   Expone la contraseña/clave criptográfica en los logs del servidor PostgreSQL, en historiales de comandos (`.bash_history`), registros de red y código fuente de la aplicación.

## Conclusión
El cifrado simétrico protege datos sensibles en reposo, pero requiere mecanismos seguros de inyección de claves fuera del motor de la base de datos.
