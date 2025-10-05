# Imagen base oficial de Keycloak
FROM quay.io/keycloak/keycloak:26.0.0

# 🔹 Configuración base de Keycloak
ENV KC_DB=postgres
ENV KC_DB_URL_PARAMETERS=sslmode=require
ENV KC_HTTP_ENABLED=true
ENV KC_PROXY=edge
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME=late-aliza-planify-e96a6595.koyeb.app

# 🔹 Usuario administrador (solo para bootstrap)
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin123

# 🔹 Compila Keycloak con la configuración anterior
RUN /opt/keycloak/bin/kc.sh build

# 🔹 Expone el puerto HTTP
EXPOSE 8080

# 🔹 Comando de inicio (modo optimizado)
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized"]
