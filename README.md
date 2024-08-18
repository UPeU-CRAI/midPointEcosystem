# midPointEcosystem

Este proyecto se centra en la construcción y despliegue de un sistema de gestión de identidades (IDM) utilizando MidPoint, integrado dentro de un ecosistema de plataformas contenerizadas y servicios interconectados. La integración se realiza principalmente a través de conectores especializados y REST APIs.

## Características Principales

- **Base de Datos Académica**: Gestión de datos académicos y su sincronización con MidPoint.
- **Directorio openLDAP**: Autenticación y gestión de usuarios basada en LDAP.
- **FreeRadius**: Autenticación de red y gestión de accesos mediante el protocolo RADIUS.
- **Keycloak**: Proveedor de identidad y SSO (Single Sign-On) para unificar la autenticación en múltiples aplicaciones.
- **Microsoft Entra ID (Graph)**: Integración con Microsoft Entra ID (anteriormente Azure AD) utilizando la API de Graph para gestionar identidades en la nube.
- **REST APIs**: Conexión con servicios externos y plataformas adicionales a través de interfaces RESTful.

## Estructura del Proyecto

Cada plataforma está organizada en su propia carpeta dentro del repositorio, permitiendo su despliegue de manera independiente. Esto proporciona flexibilidad para desarrollar, probar y desplegar cada componente del ecosistema de manera modular y eficiente.

# Extensibilidad del esquema de Midpoint
Para ampliar el esquema, simplemente copie su archivo XSD en la siguiente ruta del servidor MidPoint:

`/opt/midpoint/var/schema`

### Proceso

```bash
docker exec -it midpoint_server /bin/bash
```

```bash
cd /opt/midpoint/var/schema
```

```bash
wget https://raw.githubusercontent.com/UPeU-CRAI/midPointEcosystem/main/initial-objects/schema-extensibility-upeu.xsd
```

resetear el contenedor Docker de MidPoint:

```bash
exit

docker restart midpoint_server
```
