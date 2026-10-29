# Informe Final - Laboratorio 02: Cifrado, credenciales y comunicaciones seguras

## 1. Introducción
Este laboratorio aborda la implementación y análisis de mecanismos de protección criptográfica en PostgreSQL 16 para resolver vulnerabilidades relacionadas con el almacenamiento de credenciales, datos sensibles en reposo y seguridad de las comunicaciones en tránsito.

## 2. Protección de credenciales
- **Texto claro:** Representación legible expuesta. Insegura para almacenar contraseñas.
- **Hash:** Transformación unidireccional no reversible con sal para validar contraseñas sin conocer la clave original.
- **Cifrado:** Transformación bidireccional reversible mediante una clave criptográfica, no recomendada para contraseñas.

## 3. Protección de datos sensibles
Se protegió el atributo RFC utilizando cifrado simétrico PGP (`pgp_sym_encrypt`), permitiendo el descifrado exclusivo a usuarios autorizados con la clave.

## 4. TLS (Transport Layer Security)
TLS garantiza confidencialidad, integridad y autenticación en el canal de comunicación cliente-servidor, evitando la observación o alteración del tráfico en red.

## 5. Gestión de claves
Las claves no deben almacenarse en repositorios Git ni scripts SQL porque permanecen en el historial de commits y se exponen ante terceros.

## 6. Resultados
Se crearon las estructuras en PostgreSQL, se validaron hashes con sal y se realizaron operaciones de cifrado/descifrado simétrico de datos.

## 7. Problemas encontrados
Manejo de permisos en contenedores y comprensión de la diferencia entre hashing y cifrado bidireccional.

## 8. Conclusiones
La seguridad integral requiere cifrado en reposo, en tránsito y políticas estrictas de gestión de claves independientes del motor de base de datos.

---

## 23. Preguntas de reflexión

1. **¿Por qué una contraseña no debe almacenarse como texto claro?**  
   Porque cualquier acceso no autorizado a la base de datos expone inmediatamente la credencial real.
2. **¿Por qué un hash no es equivalente a un cifrado?**  
   Porque el hash es unidireccional (no se puede revertir), mientras que el cifrado es bidireccional (se puede descifrar con la clave).
3. **¿Por qué el cifrado de una columna no sustituye al control de acceso?**  
   El cifrado protege la confidencialidad en almacenamiento, pero no gestiona los permisos de ejecución ni las identidades autorizadas a realizar operaciones sobre el sistema.
4. **¿Por qué TLS no sustituye a los mecanismos de autorización de PostgreSQL?**  
   TLS asegura el canal de comunicación en tránsito, pero no valida qué tablas o filas puede consultar o modificar un usuario.
5. **¿Qué ocurriría si una organización pierde una clave utilizada para cifrar información?**  
   La información queda inaccesible de forma permanente (*data loss*).
6. **¿Qué ocurriría si una clave criptográfica se publica accidentalmente en GitLab?**  
   Cualquier persona con acceso al historial del repositorio podrá descifrar los datos asociados.
7. **¿Por qué un repositorio privado no debe considerarse un almacén de secretos?**  
   Porque conserva el historial de cambios y concede acceso a múltiples desarrolladores o integraciones sin controles de acceso criptográficos adecuados.
8. **¿Qué diferencia existe entre proteger información almacenada y proteger información durante su transmisión?**  
   Proteger información almacenada previene ataques en discos/tablas (*at rest*), mientras que proteger en transmisión evita la intercepción en redes (*in transit*).
9. **¿Por qué la gestión de claves es tan importante como el algoritmo criptográfico?**  
   Porque si la clave es expuesta o vulnerada, la robustez matemática del algoritmo de cifrado queda completamente anulada.
10. **¿Qué mecanismo adicional implementarías para proteger los respaldos de las bases de datos?**  
    Cifrado de archivos de respaldo (*backup encryption*) con claves gestionadas por un servicio externo KMS y almacenamiento en repositorios inmutables.
