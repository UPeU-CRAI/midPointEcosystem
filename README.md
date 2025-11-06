# midPointEcosystem

Repositorio reestructurado para gestionar la configuración de midPoint 4.9.x de la UPeU mediante MidPoint Studio y prácticas GitOps.

## Componentes Clave

- **midPoint** (`/midpoint`): objetos listos para importar (arquetipos, organizaciones, recursos, roles, tareas, autenticación, etc.).
- **datasets** (`/datasets/csv`): archivos CSV de ejemplo para laboratorios (SIS, RRHH, CRM).
- **docs** (`/docs`): lineamientos de arquitectura, convenciones, reglas de mapeo, correlación, ciclo de vida y guía de ejecución.
- **archive** (`/archive/previous`): artefactos heredados preservados para referencia histórica.

## Uso Rápido

1. Abra el repositorio en MidPoint Studio; el descriptor está en `/midpoint/midpoint-project.yaml`.
2. Revise y actualice los valores `{{VARIABLE}}` antes de importar (hostnames, rutas CSV, secretos, OIDs reales, etc.).
3. Importe los objetos desde MidPoint Studio o via REST siguiendo `docs/execution-guide.md`.
4. Ejecute las tareas de simulación para validar el impacto antes de pasar a ejecución real.
5. Consulte la documentación en `/docs` para conocer nomenclaturas, correlaciones y flujos propuestos.

## Contenido Legacy

Los archivos originales se movieron a `/archive/previous` para mantener el historial sin afectar la nueva estructura GitOps.

## TODOs Parametrizables

- `{{OID_USER_TEMPLATE}}`: actualizar con el OID real del Object Template en producción.
- `{{OID_ROLE_STUDENT}}`, `{{OID_ROLE_PROFESSOR}}`, `{{OID_ROLE_STAFF}}`: reemplazar por los OID definitivos de roles en el entorno objetivo.
- `{{AD_HOSTNAME}}`, `{{AD_PORT}}`, `{{AD_BASE_DN}}`, `{{AD_BIND_DN}}`, `{{SECRET}}`: completar datos de conexión al Active Directory.
- `{{CSV_SIS_PATH}}`, `{{CSV_RRHH_PATH}}`, `{{CSV_CRM_PATH}}`: definir rutas absolutas a los archivos CSV montados en el contenedor.
- `{{OID_ENTRA_CONNECTOR}}`, `{{ENTRA_CLIENT_ID}}`, `{{ENTRA_TENANT_ID}}`, `{{ENTRA_AUTHORITY}}`, `{{ENTRA_SCOPE}}`, `{{ENTRA_ISSUER_URI}}`, `{{ENTRA_AUTHORIZATION_ENDPOINT}}`, `{{ENTRA_TOKEN_ENDPOINT}}`, `{{ENTRA_USERINFO_ENDPOINT}}`, `{{ENTRA_END_SESSION_ENDPOINT}}`: configurar integración con Microsoft Entra ID.
- `{{MIDPOINT_OIDC_REDIRECT_URI}}`: establecer la URL de retorno para la autenticación OIDC de la GUI.
- `{{SECRET}}` (repetido): reemplazar en todos los recursos y políticas por mecanismos seguros (vault, variables de entorno).

Revise también los comentarios `<!-- TODO: ... -->` dentro de los archivos para completar pendientes específicos.
