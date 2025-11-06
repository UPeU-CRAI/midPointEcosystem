# Esquema de Extensión de Midpoint para la UPeU (Versión 3.0)

## 1. Visión General

Este documento describe la arquitectura y el contenido del **Esquema de Extensión para Personas UPeU**, un modelo de datos maestro diseñado para actuar como la **fuente única de la verdad (Single Source of Truth)** para la identidad digital de todos los individuos en el ecosistema de la Universidad Peruana Unión.

La arquitectura de este esquema es **holística, estandarizada y escalable**, permitiendo la integración de diversas plataformas como Koha, DSpace CRIS, OJS, Indico, sistemas de RRHH, portales académicos y financieros.

## 2. Principios de Arquitectura y Diseño

El esquema se construye siguiendo una filosofía de prioridades claras para garantizar la estandarización y evitar la redundancia:

1.  **Nativo de Midpoint Primero:** Se reutilizan al máximo los atributos estándar que Midpoint ofrece para `UserType`.
2.  **Estándares Globales (schema.org):** Para conceptos comunes que no son nativos en Midpoint, se adoptan las definiciones del vocabulario de `schema.org/Person`.
3.  **Estándares Nacionales:** Se incorporan atributos específicos de los estándares peruanos de investigación y académicos (ej. CONCYTEC).
4.  **Atributos Específicos de Aplicación:** Únicamente los atributos que solo tienen sentido dentro de una plataforma concreta se aíslan en su propia sección para mantener el modelo limpio.

## 3. Arquitectura de Capas (Definitions)

El esquema está organizado en capas lógicas utilizando `Definitions` de Midpoint. Esto permite una clara separación de intereses y facilita la gestión y escalabilidad.

-   **`identity`**: Contiene los identificadores únicos y oficiales de una persona.
-   **`personDetails`**: Almacena atributos demográficos y personales genéricos.
-   **`employment`**: Guarda información sobre la relación laboral, contractual y de afiliación.
-   **`academic`**: Centraliza el perfil de investigador y académico.
-   **`peruStandards`**: Aloja identificadores de los estándares nacionales de Perú.
-   **`[nombre_sistema]`**: Definiciones específicas para cada plataforma integrada (ej. `koha`, `ojs`, `indico`, `dspaceCris`).

## 4. Arquitectura del Conector Java

El código fuente del conector ha sido refactorizado siguiendo una arquitectura modular y principios de diseño SOLID para mejorar la mantenibilidad, legibilidad y testeabilidad. La estructura se organiza de la siguiente manera:

-   **`RestUsersConnector.java` (Orquestador):** Es la clase principal y punto de entrada que implementa las interfaces de ConnId. Su única responsabilidad es orquestar las operaciones, delegando el trabajo pesado a componentes especializados.
-   **Paquete `model`:**
    -   `AttributeMetadata.java`: Una clase POJO que define la estructura para los metadatos de los atributos, desacoplando la definición del atributo de su lógica de mapeo.
-   **Clase `KohaAuthenticator.java`:** Centraliza toda la lógica de autenticación (Basic y OAuth2). Crea un cliente HTTP pre-configurado que añade automáticamente las cabeceras de `Authorization` a cada petición, desacoplando los servicios de los detalles de autenticación.
-   **Paquete `services`:**
    -   `PatronService.java` y `CategoryService.java`: Contienen la lógica de negocio para cada tipo de objeto. Son responsables de construir las peticiones HTTP, interactuar con los endpoints específicos de la API de Koha y manejar las respuestas. No tienen conocimiento de la autenticación.
-   **Paquete `mappers`:**
    -   `BaseMapper.java`, `PatronMapper.java`, `CategoryMapper.java`: Son los especialistas en la transformación de datos. Convierten los objetos `ConnectorObject` de Midpoint a formato JSON para enviar a la API, y viceversa. Contienen el "diccionario" de atributos y sus mapeos.

Esta separación de responsabilidades hace que el conector sea robusto y fácil de extender para futuras integraciones.

## 5. Diccionario de Atributos del Esquema (`upeuPerson`)

Esta sección detalla todos los atributos utilizados en el modelo de identidad de la UPeU.

### 5.1. Atributos Nativos de Midpoint (Usados Directamente)

-   **`givenName`**: Nombres.
-   **`familyName`**: Apellidos.
-   **`additionalName`**: Segundo nombre.
-   **`honorificPrefix`**: Prefijo honorífico (Dr., Ing.).
-   **`honorificSuffix`**: Sufijo honorífico (PhD, M.Sc.).
-   **`emailAddress`**: Email principal.
-   **`telephoneNumber`**: Teléfono principal.
-   **`mobile`**: Teléfono móvil.
-   **`fax`**: Número de fax.
-   **`address`**: Dirección principal (tipo complejo).
-   **`organization`**: Departamento o unidad organizativa principal.
-   **`organizationalUnit`**: Sub-unidades organizativas.
-   **`jobTitle`**: Cargo oficial.
-   **`employeeNumber` / `studentNumber`**: Código institucional de empleado o estudiante.
-   **`jpegPhoto`**: Foto de perfil.

### 5.2. Atributos de Extensión (`upeuPerson`)

#### Capa: `identity` (Identificadores)

-   `taxId`: Para el DNI, RUC u otro ID fiscal.
-   `alternateName`: Nombres alternativos, alias, nombre de casada/o (multivalor).
-   `universityIdCard`: Carnet Universitario oficial (regulado por SUNEDU).
-   `institutionalIdCard`: Tarjeta de Identificación interna de la UPeU.
-   `hasCredential`: Credenciales educativas o profesionales (certificaciones, licencias) (multivalor).
-   `sameAs`: URL a perfiles de referencia (Wikipedia, Wikidata) (multivalor).

#### Capa: `personDetails` (Detalles Personales)

-   `birthDate`: Fecha de nacimiento.
-   `birthPlace`: Lugar de nacimiento.
-   `deathDate`: Fecha de fallecimiento.
-   `gender`: Género.
-   `nationality`: Nacionalidad.
-   `pronouns`: Pronombres personales.
-   `url`: Páginas web personales (blog, LinkedIn, etc.) (multivalor).
-   `biography`: Resumen biográfico.
-   `knowsLanguage`: Idiomas conocidos (multivalor).

#### Capa: `employment` (Información Laboral)

-   `affiliation`: Afiliación principal (Facultad, etc.).
-   `alumniOf`: Instituciones de las que es egresado (multivalor).
-   `hasOccupation`: Ocupación o profesión (ej. "Bibliotecólogo").
-   `worksFor`: Otras organizaciones para las que trabaja (multivalor).
-   `contractStartDate`: Fecha de inicio de contrato.
-   `contractEndDate`: Fecha de fin de contrato.

#### Capa: `academic` (Perfil Académico)

-   `orcid`: Identificador ORCID.
-   `scopusId`: Identificador Scopus.
-   `researcherId`: ID de Researcher (WoS/Publons).
-   `googleScholarId`: ID de perfil de Google Scholar.
-   `award`: Premios y reconocimientos (multivalor).
-   `interests`: Áreas de interés de investigación (multivalor).
-   `skills`: Habilidades o competencias (multivalor).

#### Capa: `peruStandards` (Estándares Nacionales)

-   `renacytCode`: Código del investigador en RENACYT (CONCYTEC).
-   `ctiVitaeId`: ID del CTI Vitae / DINA (CONCYTEC).

#### Capa: `koha` (Específicos de Koha)

-   `branchCode`: Código de la sede o biblioteca.
-   `categoryId`: ID de la categoría de usuario.
-   `staffNotes`: Notas internas del personal.
-   `opacNotes`: Notas visibles en el OPAC.
-   `smsNumber`: Número para notificaciones SMS.
-   `dateEnrolled`: Fecha de inscripción en la biblioteca.
-   `dateRenewed`: Fecha de última renovación.

#### Capa: `ojs` (Específicos de OJS)

-   `userRole`: Roles como "Author", "Reviewer" (multivalor).
-   `gossip`: Notas privadas.
-   `signature`: Firma de correo.
-   `preferredPublicName`: Nombre público preferido.

#### Capa: `dspaceCris` (Específicos de DSpace CRIS)

-   `crisInternalId`: ID interno del perfil en CRIS.
-   `epersonId`: ID del EPerson en DSpace.

#### Capa: `indico` (Específicos de Indico)

-   `indicoUserId`: ID numérico del usuario.
-   `avatarUrl`: URL de la foto de perfil.

## 6. Guía de Mapeo de Atributos

Las siguientes tablas sirven como referencia para configurar el mapeo de atributos (`schemaHandling`) en los recursos de Midpoint para cada plataforma.

### 6.1. Mapeo para Koha

| Atributo en Midpoint (Modelo Central)                    | Atributo en Koha (API) | Notas / Lógica de Mapeo                                                                                              |
| -------------------------------------------------------- | ---------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `name` (Nativo)                                          | `userid`               | Mapeo directo del nombre de usuario de Midpoint.                                                                     |
| `givenName` (Nativo)                                     | `firstname`            | Mapeo directo.                                                                                                       |
| `familyName` (Nativo)                                    | `surname`              | Mapeo directo.                                                                                                       |
| `additionalName` (Nativo)                                | `middle_name`          | Mapeo directo.                                                                                                       |
| `honorificPrefix` (Nativo)                               | `title`                | Títulos como Dr., Ing., etc.                                                                                         |
| `emailAddress` (Nativo)                                  | `email`                | Mapeo directo.                                                                                                       |
| `telephoneNumber` (Nativo)                               | `phone`                | Mapeo directo.                                                                                                       |
| `mobile` (Nativo)                                        | `mobile`               | Mapeo directo.                                                                                                       |
| `fax` (Nativo)                                           | `fax`                  | Mapeo directo.                                                                                                       |
| `extension/identity/institutionalIdCard`                 | `cardnumber`           | El ID Card institucional es la tarjeta de la biblioteca.                                                             |
| `extension/koha/branchCode`                              | `library_id`           | Específico de Koha: define la sede de la biblioteca.                                                                 |
| `extension/koha/categoryId`                              | `category_id`          | Específico de Koha: define el tipo de usuario (DOCEN, EST).                                                          |
| `extension/personDetails/birthDate`                      | `date_of_birth`        | Mapeo directo.                                                                                                       |
| `extension/employment/contractEndDate`                   | `expiry_date`          | La fecha de fin de contrato puede usarse para la expiración de la cuenta en Koha.                                    |
| `extension/koha/staffNotes`                              | `staff_notes`          | Específico de Koha.                                                                                                  |
| `extension/koha/opacNotes`                               | `opac_notes`           | Específico de Koha.                                                                                                  |
| `extension/personDetails/gender`                         | `gender`               | Mapeo directo.                                                                                                       |
| `extension/personDetails/pronouns`                       | `pronouns`             | Mapeo directo.                                                                                                       |
| `address` (Nativo, tipo complejo)                        | `address`, `city`, etc. | Mapear los sub-campos (`street`, `locality`, `postalCode`, `country`) de Midpoint a los campos de Koha. |
| `activation/administrativeStatus` == `DISABLED`          | `restricted`           | Lógica de mapeo: si el usuario está deshabilitado en Midpoint, se marca como restringido en Koha.                 |

### 6.2. Mapeo para OJS

| Atributo en Midpoint (Modelo Central)              | Atributo en OJS (API)     | Notas / Lógica de Mapeo                                                                         |
| -------------------------------------------------- | ------------------------- | ----------------------------------------------------------------------------------------------- |
| `name` (Nativo)                                    | `userName`                | Mapeo directo.                                                                                  |
| `givenName` (Nativo)                               | `givenName`               | Mapeo directo.                                                                                  |
| `familyName` (Nativo)                              | `familyName`              | Mapeo directo.                                                                                  |
| `fullName` (Nativo)                                | `fullName`                | Mapeo directo.                                                                                  |
| `emailAddress` (Nativo)                            | `email`                   | Mapeo directo.                                                                                  |
| `extension/employment/affiliation`                 | `affiliation`             | La afiliación principal de Midpoint se usa como la afiliación en OJS.                           |
| `extension/personDetails/biography`                | `biography`               | Mapeo directo.                                                                                  |
| `extension/academic/orcid`                         | `orcid`                   | Mapeo directo del identificador estándar.                                                       |
| `extension/academic/interests`                     | `interests` (array)       | Atributo multivalor para las áreas de interés.                                                  |
| `extension/ojs/userRole`                           | `groups` (array)          | Los roles asignados en Midpoint se mapean a los grupos a los que pertenece el usuario en OJS.   |
| `activation/administrativeStatus` == `DISABLED`    | `disabled`                | Mapeo directo del estado de la cuenta.                                                         |
| `extension/ojs/gossip`                             | `gossip`                  | Notas privadas específicas de OJS.                                                              |
| `extension/ojs/signature`                          | `signature`               | Firma de correo específica de OJS.                                                              |
| `extension/personDetails/url`                      | `url`                     | URL del perfil personal.                                                                        |
| `locale` (Nativo)                                  | `locales`                 | El idioma de preferencia del usuario.                                                           |

### 6.3. Mapeo para Indico

| Atributo en Midpoint (Modelo Central)    | Atributo en Indico (API) | Notas / Lógica de Mapeo                                      |
| ---------------------------------------- | ------------------------ | ------------------------------------------------------------ |
| `givenName` (Nativo)                     | `first_name`             | Mapeo directo.                                               |
| `familyName` (Nativo)                    | `last_name`              | Mapeo directo.                                               |
| `fullName` (Nativo)                      | `full_name`              | Mapeo directo.                                               |
| `emailAddress` (Nativo)                  | `email`                  | Mapeo directo.                                               |
| `extension/employment/affiliation`       | `affiliation`            | La afiliación principal se usa como la afiliación en Indico. |
| `telephoneNumber` (Nativo)               | `phone`                  | Mapeo directo.                                               |
| `jpegPhoto` (Nativo)                     | `avatar_url`             | Se podría requerir una lógica para exponer la URL de la foto. |
| `extension/indico/indicoUserId`          | `id` / `identifier`      | Atributo específico para almacenar el ID del usuario en Indico. |

### 6.4. Mapeo para DSpace / DSpace CRIS

| Atributo en Midpoint (Modelo Central)                     | Atributo en DSpace/CRIS (Metadatos) | Notas / Lógica de Mapeo                                                                         |
| --------------------------------------------------------- | ----------------------------------- | ----------------------------------------------------------------------------------------------- |
| `fullName` (Nativo)                                       | `dc.title`                          | El nombre completo se usa como el título del ítem de Investigador (CRIS).                         |
| `familyName` (Nativo) + `, ` + `givenName` (Nativo)       | `dc.contributor.author`             | El nombre en formato "Apellido, Nombre" es el estándar para la autoría.                         |
| `emailAddress` (Nativo)                                   | `eperson.email`                     | Mapeo directo al email del EPerson.                                                             |
| `extension/personDetails/biography`                       | `dc.description.abstract`           | La biografía se puede mapear al resumen del perfil del investigador.                            |
| `extension/academic/orcid`                                | `person.identifier.orcid`           | Mapeo al campo específico de ORCID en DSpace-CRIS.                                              |
| `extension/academic/scopusId`                             | `person.identifier.scopus`          | Mapeo al campo específico de Scopus ID.                                                         |
| `extension/peruStandards/renacytCode`                     | `person.identifier.renacyt`         | Campo para el código RENACYT.                                                                   |
| `extension/peruStandards/ctiVitaeId`                      | `person.identifier.dina`            | Campo para el ID de CTI Vitae (DINA).                                                           |
| `extension/employment/affiliation`                        | `person.affiliation`                | La afiliación principal se mapea al campo de afiliación del investigador.                       |
| `extension/dspaceCris/crisInternalId`                     | `cris.id`                           | Atributo específico para almacenar el ID interno del objeto CRIS.                               |
| `extension/dspaceCris/epersonId`                          | `eperson.id`                        | Atributo específico para almacenar el ID del objeto EPerson.                                    |
