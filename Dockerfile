# Imagen base oficial de Keycloak
FROM quay.io/keycloak/keycloak:26.0.0

# Modo de desarrollo (no requiere base de datos externa)
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--http-port=8080", "--hostname-strict=false"]
