# Reglas de Mapeo

## Inbound (SIS CSV → Usuario)

| Atributo CSV | Destino midPoint | Transformación | Ejemplo |
|--------------|------------------|----------------|---------|
| `givenName`  | `c:givenName`    | Copia directa  | `Rosa` |
| `familyName` | `c:familyName`   | Copia directa  | `Pérez` |
| `email`      | `c:emailAddress` | Copia directa  | `rosa.perez@upeu.edu.pe` |
| `uid`        | `extension/sisId`| Copia directa  | `20250001` |
| `archetype`  | `archetypeRef`   | Script → `ArchetypeType` | `StudentType` |
| `orgCode`    | `extension/orgCode` | Copia directa | `FAC-XXX` |

## Outbound (Usuario → Active Directory)

| Atributo Usuario | Destino AD | Transformación | Ejemplo |
|------------------|------------|----------------|---------|
| `name`           | `sAMAccountName` | Copia directa | `rperez` |
| `name`           | `userPrincipalName` | Sufijo `@upeu.edu.pe` | `rperez@upeu.edu.pe` |
| `fullName`/`name`| `cn` | Usa `fullName` y fallback `name` | `Rosa Pérez` |
| `emailAddress`   | `mail` | Copia directa | `rosa.perez@upeu.edu.pe` |
| `archetypeRef`   | `ou` | Script → OU dinámica | `OU=Students,OU=Accounts,DC=upeu,DC=edu,DC=pe` |
| `assignments`    | `group` (entitlement) | Inducido por roles base | `GRP-UPEU-Students-Base` |

## Pendientes

- <!-- TODO: definir reglas outbound para Entra ID -->
- <!-- TODO: mapear atributos opcionales (teléfono, programa académico, etc.) -->
