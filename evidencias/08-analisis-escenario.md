# Evidencia 08: Análisis de escenario de seguridad

## Respuestas al Análisis

### Pregunta 1: ¿Cuáles son los principales riesgos del escenario planteado?
- **Filtración masiva de credenciales:** Al estar en texto claro, un compromiso de la tabla expone las contraseñas reales.
- **Intercepción de tráfico:** Redes no seguras permiten captura de información sensible.
- **Exposición de llaves en código:** Secretos expuestos en scripts SQL vulneran los datos cifrados.
- **Respaldos vulnerables:** Un robo de archivo `.dump` compromete toda la organización.

### Pregunta 2: ¿Qué mecanismo utilizarías para cada elemento?
- **Contraseñas:** Hash con derivación (Bcrypt/Argon2).
- **RFC e Información Financiera:** Cifrado simétrico en columna o cifrado de disco/volumen.
- **Comunicaciones:** TLS con validación `verify-full`.
- **Claves Criptográficas:** Gestor de claves KMS / Variables de entorno cifradas.
- **Respaldos:** Cifrado del archivo comprimido con clave simétrica almacenada en un KMS.

### Pregunta 3: ¿Cuál de los problemas consideras más crítico y por qué?
El almacenamiento de contraseñas y claves criptográficas en texto claro, pues la pérdida del control sobre las llaves anula todos los demás esfuerzos de cifrado y autenticación.

### Pregunta 4: ¿Tener correctamente configurados los usuarios y permisos elimina estos riesgos?
**No.** El control de acceso gestiona *quién* puede solicitar una operación, pero no protege el dato si el medio físico/red o los archivos de respaldo son interceptados fuera del motor.
