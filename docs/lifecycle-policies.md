# Políticas de Ciclo de Vida

## Estudiantes (StudentType)

- **Alta**: activación al recibir registro del SIS.
- **Activo**: vigencia mientras exista matrícula vigente.
- **Egreso**: mantener acceso 6 meses post egreso. <!-- TODO: validar periodo oficial -->
- **Desactivación**: mover a OU de alumni y revocar roles especializados.

## Docentes (ProfessorType)

- **Alta**: creación desde SIS o RRHH.
- **Activo**: mientras exista contrato vigente.
- **Suspensión**: marcar con `administrativeStatus=disabled` cuando RRHH reporte pausa.
- **Desactivación**: 30 días después de fin de contrato, conservando correo para reingresos. <!-- TODO: definir retención exacta -->

## Personal Administrativo/Técnico

- **Alta**: provisto por RRHH.
- **Activo**: contrato vigente.
- **Desactivación diferida**: 15 días posteriores para permitir transferencias de conocimiento.
- **Borrado**: se realiza manualmente luego de auditoría. <!-- TODO: describir proceso de borrado -->
