# Evidencia 03: El problema de la gestión de claves

## Objetivo
Identificar las malas prácticas asociadas al almacenamiento de claves en código fuente (*hardcoded secrets*) y repositorios de control de versiones.

## Análisis de caso
Incluir claves como `'CLAVE-DE-PRUEBA'` directamente en archivos SQL o código de aplicación provoca:
- Filtración involuntaria en repositorios Git (públicos o privados).
- Pérsistencia de secretos dentro del historial de commits aunque el archivo sea eliminado después.
- Acceso no autorizado por parte de cualquier desarrollador o auditor con permiso de lectura al repositorio.

## Conclusión
Las claves criptográficas deben administrarse mediante gestores externos de secretos (Vault, variables de entorno, KMS) y nunca en el código fuente.
