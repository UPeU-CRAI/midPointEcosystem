# Arquitectura de Referencia

```
SIS CSV (autoridad) --> midPoint (inbound + plantillas) --> Active Directory (destino fuerte)
                                             \
                                              --> Entra ID / Otros destinos (futuro)
```

## Fases de Implementación

1. **Fase 1 - SIS CSV**: importar registros de estudiantes y docentes desde CSV para establecer identidades base.
2. **Fase 2 - RRHH y CRM**: incorporar nuevas fuentes CSV para completar datos laborales y de relacionamiento.
3. **Fase 3 - Entra ID**: propagar identidades consolidadas hacia servicios en la nube mediante Graph API.
4. **Fase 4 - Optimización**: habilitar reconcilaciones periódicas, alertas y dashboard específicos.

## Decisiones Clave

- MidPoint 4.9.x como motor central por compatibilidad con MidPoint Studio.
- CSV como formato inicial para acelerar laboratorios en Docker.
- Active Directory como destino fuerte para habilitar Single Sign-On interno.
- Plantilla de usuario única con generación automática de `name` y correo institucional.
