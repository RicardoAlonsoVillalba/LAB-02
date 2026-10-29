-- Verificación de parámetros generales de SSL/TLS
SHOW ssl;
SHOW ssl_min_protocol_version;
SHOW port;
SHOW listen_addresses;

-- Información de la conexión del cliente actual
SELECT inet_client_addr(), inet_client_port();

-- Verificación de estado de TLS en la sesión backend actual
SELECT ssl, version, cipher
FROM pg_stat_ssl
WHERE pid = pg_backend_pid();
