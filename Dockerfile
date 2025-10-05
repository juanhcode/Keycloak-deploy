FROM quay.io/keycloak/keycloak:26.0.0

# Configuración base de Keycloak
ENV KC_DB=postgres
ENV KC_DB_URL_PARAMETERS=sslmode=require
ENV KC_HOSTNAME_STRICT=false
ENV KC_HTTP_ENABLED=true
ENV KC_PROXY=edge

# Usuario administrador quemado (necesario en build y runtime)
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin123

# 🔹 Ejecutamos el build DESPUÉS de definir las variables
RUN /opt/keycloak/bin/kc.sh build

EXPOSE 8080

# 🔹 Usa 'start --optimized' (más eficiente y recomendado tras build)
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized"]
