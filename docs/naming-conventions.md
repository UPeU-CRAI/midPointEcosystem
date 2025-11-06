# Convenciones de Nombres

## Unidades Organizacionales (Active Directory)

- Estudiantes: `OU=Students,OU=Accounts,DC=upeu,DC=edu,DC=pe`
- Docentes: `OU=Professors,OU=Accounts,DC=upeu,DC=edu,DC=pe`
- Personal (administrativo y técnico): `OU=Staff,OU=Accounts,DC=upeu,DC=edu,DC=pe`
- Grupos: `OU=Groups,DC=upeu,DC=edu,DC=pe`

<!-- TODO: ajustar OUs finales por campus/sede si aplica -->

## Grupos Base

- Estudiantes: `GRP-UPEU-Students-Base`
- Docentes: `GRP-UPEU-Professors-Base`
- Personal: `GRP-UPEU-Staff-Base`

## OIDs Reservados

- Plantilla de usuario: `11a9fc09-9b4b-4fe3-9ff5-8c9b5a4d440f`
- Arquetipos principales: ver `/midpoint/archetypes/*.xml`
- Roles base: ver `/midpoint/roles/*.xml`

Documentar cualquier nuevo OID en esta tabla antes de mover a producción.
