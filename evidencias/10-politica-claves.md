# Evidencia 10: Política mínima de protección de claves criptográficas

1. **Generación:** Las claves deben generarse utilizando generadores aleatorios criptográficamente seguros (CSPRNG) con longitudes mínimas de 256 bits para algoritmos simétricos.
2. **Almacenamiento:** Ninguna clave criptográfica debe almacenarse en el código fuente, scripts SQL ni repositorios de control de versiones.
3. **Acceso:** El acceso a las claves de descifrado debe estar restringido exclusivamente a las identidades de servicio autorizadas bajo el principio de menor privilegio.
4. **Inyección de Secretos:** Las claves deben inyectarse en la aplicación en tiempo de ejecución mediante variables de entorno o mediante un servicio centralizado de gestión de claves (ej. HashiCorp Vault, AWS KMS).
5. **Rotación:** Las claves de cifrado de datos deben rotarse periódicamente (mínimo una vez al año) o de forma inmediata ante cualquier sospecha de compromiso.
6. **Respaldo:** Los respaldos de claves criptográficas deben custodiarse cifrados en ubicaciones geográficamente separadas y segregadas del respaldo de la base de datos.
7. **Revocación:** Debe existir un procedimiento documentado para invalidar y revocar claves comprometidas de manera inmediata.
8. **Eliminación:** La destrucción de claves debe ser irreversible mediante técnicas de borrado seguro (*crypto-shredding*) para garantizar que los datos asociados sean irrecuperables.
