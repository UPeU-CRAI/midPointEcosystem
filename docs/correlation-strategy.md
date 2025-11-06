# Estrategia de Correlación

1. **`extension/sisId`** (SIS CSV): identificador único emitido por el sistema académico. Evita colisiones incluso si cambian nombres o correos.
2. **`emailAddress`**: respaldo cuando el SIS no provea `sisId` o para fuentes secundarias (RRHH/CRM).
3. **Revisión manual**: si ninguno coincide, la tarea debe generar reporte de simulación y el operador decide.

Justificación:

- Priorizar identificadores técnicos reduce duplicados.
- El correo institucional es estable en UPeU, pero puede cambiar por matrimonios o ajustes ortográficos, por eso se usa como segundo criterio.
- Cualquier nueva fuente debe alinearse a esta jerarquía antes de la importación real.
