# Imagen base oficial de Keycloak
FROM quay.io/keycloak/keycloak:26.0.0

# Cambia a modo producción con base de datos PostgreSQL
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://${PGHOST}:5432/${PGDATABASE}
ENV KC_DB_USERNAME=${PGUSER}
ENV KC_DB_PASSWORD=${PGPASSWORD}
ENV KC_DB_URL_PARAMETERS=sslmode=require

# Desactiva verificación estricta del hostname (útil para despliegues en Koyeb)
ENV KC_HOSTNAME_STRICT=false
ENV KC_HTTP_ENABLED=true
ENV KC_PROXY=edge

# Puerto de Keycloak
EXPOSE 8080

# Ejecuta Keycloak en modo producción
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized"]
