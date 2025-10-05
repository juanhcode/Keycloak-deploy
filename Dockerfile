FROM quay.io/keycloak/keycloak:26.0.0

# Configuración base de Keycloak
ENV KC_DB=postgres
ENV KC_DB_URL_PARAMETERS=sslmode=require
ENV KC_HOSTNAME_STRICT=false
ENV KC_HTTP_ENABLED=true
ENV KC_PROXY=edge

# Build del servidor optimizado
RUN /opt/keycloak/bin/kc.sh build

EXPOSE 8080

# Comando de inicio: las variables reales se pasan desde Koyeb
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]
