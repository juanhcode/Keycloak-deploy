# Imagen base oficial de Keycloak
FROM quay.io/keycloak/keycloak:26.0.0

# Configuración de la base de datos PostgreSQL
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://${PGHOST}:5432/${PGDATABASE}
ENV KC_DB_USERNAME=${PGUSER}
ENV KC_DB_PASSWORD=${PGPASSWORD}
ENV KC_DB_URL_PARAMETERS=sslmode=require

# Configuración general
ENV KC_HOSTNAME_STRICT=false
ENV KC_HTTP_ENABLED=true
ENV KC_PROXY=edge

# Construir Keycloak en modo optimizado (solo se hace durante build)
RUN /opt/keycloak/bin/kc.sh build

# Puerto expuesto
EXPOSE 8080

# Ejecutar Keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]
