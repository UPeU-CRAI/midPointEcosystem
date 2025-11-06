# Guía de Ejecución

## Preparación del Entorno

1. Clonar el repositorio y abrir el proyecto con MidPoint Studio.
2. Montar los CSV en el contenedor de midPoint (ejemplo `docker-compose`):
   ```yaml
   volumes:
     - ./datasets/csv:/opt/midpoint/var/datasets
   ```
3. Actualizar el recurso `SIS-CSV` (`/midpoint/resources/db-sis/SIS-CSV.xml`) para que `<filePath>` apunte a `/opt/midpoint/var/datasets/sis-sample.csv`. <!-- TODO: parametrizar ruta en despliegue GitOps -->
4. Configurar secretos (`{{SECRET}}`) mediante variables de entorno o vault antes de importar.

## Importación de Objetos

- Desde MidPoint Studio ejecutar "Import Project Objects" para cargar `/midpoint/**/*`.
- Alternativamente, usar REST `POST /ws/rest/import/object` para cada archivo.
- Validar en la GUI que arquetipos, roles y recursos quedaron habilitados.

## Simulaciones

1. Importar las tareas en `/midpoint/tasks`.
2. Ejecutar `Import SIS Simulation`.
3. Revisar el reporte desde **Simulations → Reports**.
4. Ejecutar `Reconcile SIS Simulation` y `Reconcile AD Simulation` para validar efectos.
5. Documentar hallazgos en `/midpoint/simulations` y compartir con el equipo.

## Paso a Ejecución Real

1. Una vez que los reportes no presenten errores críticos, cambiar `<simulationMode>` a `none` o eliminar el bloque `<options>`.
2. Habilitar los schedules (`<enabled>true</enabled>`) o lanzar las tareas manualmente.
3. Monitorear la primera ejecución real y registrar incidencias.

## Datos de Prueba

- `datasets/csv/sis-sample.csv`: estudiantes y docentes base.
- `datasets/csv/rrhh-sample.csv`: estructura preliminar para RRHH.
- `datasets/csv/crm-sample.csv`: ejemplo de export CRM.

Mantener estos archivos sincronizados con los recursos correspondientes antes de cada laboratorio.
