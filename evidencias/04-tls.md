# Evidencia 04: Verificación del estado de TLS

## Objetivo
Verificar la configuración de seguridad en tránsito mediante el protocolo TLS en PostgreSQL.

## Procedimiento y Comandos
Ejecución del script `sql/03-verificacion-tls.sql` en la consola interactiva `psql`.

## Respuestas al cuestionario técnico
1. **¿La conexión actual utiliza TLS?**  
   Dependerá del entorno. En el contenedor básico por defecto de Docker muestra `ssl = false`, lo que significa conexión en texto claro.
2. **¿Qué versión de TLS se está utilizando?**  
   Si está habilitado, típicamente TLSv1.2 o TLSv1.3.
3. **¿Qué algoritmo de cifrado aparece?**  
   Muestra la suite criptográfica activa en la vista `pg_stat_ssl` (ejemplo: `ECDHE-RSA-AES256-GCM-SHA384`).
4. **¿Qué diferencia existe entre una conexión con TLS y sin TLS?**  
   Una conexión sin TLS envía la información en texto claro (expuesta a *sniffing* o *man-in-the-middle*); con TLS las comunicaciones viajan cifradas, con integridad verificada y autenticación del servidor.

## Conclusión
TLS garantiza la confidencialidad e integridad del tráfico de datos en movimiento entre el cliente y el servidor.
