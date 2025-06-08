<schema xmlns="http://midpoint.evolveum.com/xml/ns/public/common/common-3"
        xmlns:c="http://midpoint.evolveum.com/xml/ns/public/common/common-3"
        oid="b7d55017-599f-4f2f-9493-9f64bba62c5b">
    
    <name>Esquema de Extensión para Personas UPeU</name>
    <description>Contiene el modelo de datos maestro y extendido para todos los objetos de tipo Persona en la UPeU.</description>
    <documentation>Versión 3.0. Este esquema define la identidad digital unificada para la integración de sistemas como RRHH, portales académicos, Koha, DSpace, OJS, etc., siguiendo una arquitectura de capas y priorizando estándares. Creado por Alberto Sánchez/Automatización el 07/06/2025.</documentation>
    
    <definition>
        <xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                    xmlns:tns="http://crai.upeu.edu.pe/xml/ns/midpoint/extension/person/v1"
                    xmlns:a="http://prism.evolveum.com/xml/ns/public/annotation-3"
                    targetNamespace="http://crai.upeu.edu.pe/xml/ns/midpoint/extension/person/v1"
                    elementFormDefault="qualified">
            
            <xsd:annotation>
                <xsd:appinfo>
                    <a:defaultPrefix>upeuPerson</a:defaultPrefix>
                </xsd:appinfo>
            </xsd:annotation>
            <xsd:import namespace="http://prism.evolveum.com/xml/ns/public/annotation-3"/>
            
            <!-- =================================================================== -->
            <!-- Capa 1: Identidad Institucional y Nacional                          -->
            <!-- =================================================================== -->
            <xsd:complexType name="identity">
                <xsd:annotation>
                    <xsd:appinfo>
                        <a:extension ref="c:UserType"/>
                        <a:displayName>Identificadores Institucionales y Nacionales</a:displayName>
                        <a:displayOrder>100</a:displayOrder>
                    </xsd:appinfo>
                </xsd:annotation>
                <xsd:sequence>
                    <xsd:element name="taxId" type="xsd:string" minOccurs="0">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>DNI / ID Fiscal</a:displayName>
                            <a:help>Documento Nacional de Identidad o identificador fiscal. Corresponde a schema.org/taxID.</a:help>
                            <a:displayOrder>110</a:displayOrder>
                            <a:indexed>true</a:indexed>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="universityIdCard" type="xsd:string" minOccurs="0">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Carnet Universitario (Oficial)</a:displayName>
                            <a:help>Número del carnet universitario oficial, regulado por la entidad gubernamental (p.ej. SUNEDU en Perú).</a:help>
                            <a:displayOrder>120</a:displayOrder>
                            <a:indexed>true</a:indexed>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="institutionalIdCard" type="xsd:string" minOccurs="0">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Tarjeta de Identificación (Institucional)</a:displayName>
                            <a:help>Número del ID Card emitido por la propia UPeU para servicios internos (biblioteca, acceso, etc.). Se mapea a 'cardnumber' de Koha.</a:help>
                            <a:displayOrder>130</a:displayOrder>
                            <a:indexed>true</a:indexed>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="alternateName" type="xsd:string" minOccurs="0" maxOccurs="unbounded">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Nombres Alternativos</a:displayName>
                            <a:help>Otros nombres, alias o nombre de casada/o. Corresponde a schema.org/alternateName.</a:help>
                            <a:displayOrder>140</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="sameAs" type="xsd:anyURI" minOccurs="0" maxOccurs="unbounded">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Perfiles Externos (sameAs)</a:displayName>
                            <a:help>URL a páginas de referencia que identifican a la persona (Wikipedia, Wikidata, etc.). Corresponde a schema.org/sameAs.</a:help>
                            <a:displayOrder>150</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                </xsd:sequence>
            </xsd:complexType>

            <!-- =================================================================== -->
            <!-- Capa 2: Detalles Personales y Demográficos                          -->
            <!-- =================================================================== -->
            <xsd:complexType name="personDetails">
                <xsd:annotation>
                    <xsd:appinfo>
                        <a:extension ref="c:UserType"/>
                        <a:displayName>Detalles Personales</a:displayName>
                        <a:displayOrder>200</a:displayOrder>
                    </xsd:appinfo>
                </xsd:annotation>
                <xsd:sequence>
                    <xsd:element name="birthDate" type="xsd:date" minOccurs="0">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Fecha de Nacimiento</a:displayName>
                            <a:help>Corresponde a schema.org/birthDate.</a:help>
                            <a:displayOrder>210</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="birthPlace" type="xsd:string" minOccurs="0">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Lugar de Nacimiento</a:displayName>
                            <a:help>Corresponde a schema.org/birthPlace.</a:help>
                            <a:displayOrder>220</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="gender" type="xsd:string" minOccurs="0">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Género</a:displayName>
                            <a:help>Corresponde a schema.org/gender.</a:help>
                            <a:displayOrder>230</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="nationality" type="xsd:string" minOccurs="0">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Nacionalidad</a:displayName>
                            <a:help>Corresponde a schema.org/nationality.</a:help>
                            <a:displayOrder>240</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="pronouns" type="xsd:string" minOccurs="0">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Pronombres</a:displayName>
                            <a:help>Pronombres personales (ej: 'ella', 'él', 'elle'). Corresponde a schema.org/pronouns.</a:help>
                            <a:displayOrder>250</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="url" type="xsd:anyURI" minOccurs="0" maxOccurs="unbounded">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Páginas Web Personales</a:displayName>
                            <a:help>URLs de páginas personales o perfiles (blog, LinkedIn, etc.). Corresponde a schema.org/url.</a:help>
                            <a:displayOrder>260</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="biography" type="xsd:string" minOccurs="0">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Biografía</a:displayName>
                            <a:help>Una breve biografía o resumen profesional. Se mapea a 'biography' de OJS. Análogo a schema.org/description.</a:help>
                            <a:displayOrder>270</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                </xsd:sequence>
            </xsd:complexType>
            
            <!-- =================================================================== -->
            <!-- Capa 3: Información Laboral y de Afiliación                         -->
            <!-- =================================================================== -->
            <xsd:complexType name="employment">
                <xsd:annotation>
                    <xsd:appinfo>
                        <a:extension ref="c:UserType"/>
                        <a:displayName>Información Laboral y Afiliación</a:displayName>
                        <a:displayOrder>300</a:displayOrder>
                    </xsd:appinfo>
                </xsd:annotation>
                <xsd:sequence>
                    <xsd:element name="affiliation" type="xsd:string" minOccurs="0">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Afiliación Principal</a:displayName>
                            <a:help>La organización/facultad principal a la que la persona está afiliada (ej: 'Facultad de Ingeniería'). Corresponde a schema.org/affiliation y se usa en Indico, OJS, etc.</a:help>
                            <a:displayOrder>310</a:displayOrder>
                            <a:indexed>true</a:indexed>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="alumniOf" type="xsd:string" minOccurs="0" maxOccurs="unbounded">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Egresado de</a:displayName>
                            <a:help>Organizaciones de las que la persona es egresada. Corresponde a schema.org/alumniOf.</a:help>
                            <a:displayOrder>320</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="hasOccupation" type="xsd:string" minOccurs="0">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Ocupación/Profesión</a:displayName>
                            <a:help>Ocupación o profesión de la persona (ej: 'Bibliotecólogo'). Corresponde a schema.org/hasOccupation.</a:help>
                            <a:displayOrder>330</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="worksFor" type="xsd:string" minOccurs="0" maxOccurs="unbounded">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Colabora con</a:displayName>
                            <a:help>Otras organizaciones para las que trabaja o colabora. Corresponde a schema.org/worksFor.</a:help>
                            <a:displayOrder>340</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="contractStartDate" type="xsd:date" minOccurs="0">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Fecha de Inicio de Contrato</a:displayName>
                            <a:displayOrder>350</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                     <xsd:element name="contractEndDate" type="xsd:date" minOccurs="0">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Fecha de Fin de Contrato</a:displayName>
                            <a:help>Se puede mapear al 'expiry_date' de Koha.</a:help>
                            <a:displayOrder>360</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                </xsd:sequence>
            </xsd:complexType>
            
            <!-- =================================================================== -->
            <!-- Capa 4: Perfil Académico y de Investigación                       -->
            <!-- =================================================================== -->
            <xsd:complexType name="academic">
                <xsd:annotation>
                    <xsd:appinfo>
                        <a:extension ref="c:UserType"/>
                        <a:displayName>Perfil Académico y de Investigación</a:displayName>
                        <a:displayOrder>400</a:displayOrder>
                    </xsd:appinfo>
                </xsd:annotation>
                <xsd:sequence>
                    <xsd:element name="orcid" type="xsd:string" minOccurs="0">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Identificador ORCID</a:displayName>
                            <a:help>Estándar global para identificación de autores. Usado en OJS, DSpace, PeruCRIS.</a:help>
                            <a:displayOrder>410</a:displayOrder>
                            <a:indexed>true</a:indexed>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="scopusId" type="xsd:string" minOccurs="0">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Identificador Scopus</a:displayName>
                            <a:displayOrder>420</a:displayOrder>
                            <a:indexed>true</a:indexed>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="researcherId" type="xsd:string" minOccurs="0">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>ID de Researcher (Wos/Publons)</a:displayName>
                            <a:displayOrder>430</a:displayOrder>
                            <a:indexed>true</a:indexed>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="googleScholarId" type="xsd:string" minOccurs="0">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>ID de Google Scholar</a:displayName>
                            <a:displayOrder>440</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="hasCredential" type="xsd:string" minOccurs="0" maxOccurs="unbounded">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Credenciales Educativas/Profesionales</a:displayName>
                            <a:help>Certificaciones, licencias, grados obtenidos. Corresponde a schema.org/hasCredential.</a:help>
                            <a:displayOrder>450</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="award" type="xsd:string" minOccurs="0" maxOccurs="unbounded">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Premios y Reconocimientos</a:displayName>
                            <a:help>Premios o reconocimientos recibidos. Corresponde a schema.org/award.</a:help>
                            <a:displayOrder>460</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="interests" type="xsd:string" minOccurs="0" maxOccurs="unbounded">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Áreas de Interés</a:displayName>
                            <a:help>Lista de intereses de investigación o académicos. Corresponde al atributo 'interests' de OJS.</a:help>
                            <a:displayOrder>470</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="skills" type="xsd:string" minOccurs="0" maxOccurs="unbounded">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Habilidades y Competencias</a:displayName>
                            <a:help>Habilidades declaradas por la persona. Corresponde a schema.org/skills.</a:help>
                            <a:displayOrder>480</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                </xsd:sequence>
            </xsd:complexType>

            <!-- =================================================================== -->
            <!-- Capa 5: Estándares Nacionales (Perú)                              -->
            <!-- =================================================================== -->
             <xsd:complexType name="peruStandards">
                <xsd:annotation>
                    <xsd:appinfo>
                        <a:extension ref="c:UserType"/>
                        <a:displayName>Estándares Nacionales (Perú)</a:displayName>
                        <a:displayOrder>500</a:displayOrder>
                    </xsd:appinfo>
                </xsd:annotation>
                <xsd:sequence>
                    <xsd:element name="renacytCode" type="xsd:string" minOccurs="0">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Código RENACYT</a:displayName>
                            <a:help>Código del Registro Nacional de Ciencia, Tecnología e Innovación Tecnológica (Reglamento de Calificación, Clasificación y Registro de los Investigadores).</a:help>
                            <a:displayOrder>510</a:displayOrder>
                            <a:indexed>true</a:indexed>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="ctiVitaeId" type="xsd:string" minOccurs="0">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>ID CTI Vitae (DINA)</a:displayName>
                            <a:help>Identificador de la hoja de vida del investigador en la plataforma DINA/PeruCRIS de CONCYTEC.</a:help>
                            <a:displayOrder>520</a:displayOrder>
                            <a:indexed>true</a:indexed>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                </xsd:sequence>
            </xsd:complexType>

            <!-- =================================================================== -->
            <!-- Capa 6: Atributos Específicos de Sistemas Integrados              -->
            <!-- =================================================================== -->
            
            <xsd:complexType name="koha">
                <xsd:annotation>
                    <xsd:appinfo>
                        <a:extension ref="c:UserType"/>
                        <a:displayName>Atributos de Koha</a:displayName>
                        <a:displayOrder>700</a:displayOrder>
                    </xsd:appinfo>
                </xsd:annotation>
                <xsd:sequence>
                    <xsd:element name="branchCode" type="xsd:string" minOccurs="0">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Código de Sede (Koha)</a:displayName>
                            <a:help>Identificador de la biblioteca o sede a la que pertenece el usuario en Koha. Se mapea al campo 'library_id'.</a:help>
                            <a:displayOrder>710</a:displayOrder>
                            <a:indexed>true</a:indexed>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="categoryId" type="xsd:string" minOccurs="0">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>ID de Categoría (Koha)</a:displayName>
                            <a:help>Identificador de la categoría de usuario en Koha (ej: 'DOCEN', 'EST'). Se mapea al campo 'category_id'.</a:help>
                            <a:displayOrder>720</a:displayOrder>
                            <a:indexed>true</a:indexed>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="staffNotes" type="xsd:string" minOccurs="0">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Notas de Personal (Koha)</a:displayName>
                            <a:displayOrder>730</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="opacNotes" type="xsd:string" minOccurs="0">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Notas de OPAC (Koha)</a:displayName>
                            <a:displayOrder>740</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="smsNumber" type="xsd:string" minOccurs="0">
                        <xsd:annotation><xsd:appinfo>
                            <a:displayName>Número SMS (Koha)</a:displayName>
                            <a:displayOrder>750</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                </xsd:sequence>
            </xsd:complexType>

            <xsd:complexType name="ojs">
                <xsd:annotation>
                    <xsd:appinfo>
                        <a:extension ref="c:UserType"/>
                        <a:displayName>Atributos de OJS</a:displayName>
                        <a:displayOrder>800</a:displayOrder>
                    </xsd:appinfo>
                </xsd:annotation>
                <xsd:sequence>
                    <xsd:element name="userRole" type="xsd:string" minOccurs="0" maxOccurs="unbounded">
                         <xsd:annotation><xsd:appinfo>
                            <a:displayName>Rol de Usuario (OJS)</a:displayName>
                            <a:help>Roles que el usuario tiene en OJS, como 'Author', 'Reviewer', 'Editor'. Se mapea al array 'groups' de OJS.</a:help>
                            <a:displayOrder>810</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="gossip" type="xsd:string" minOccurs="0">
                         <xsd:annotation><xsd:appinfo>
                            <a:displayName>Notas Privadas (OJS)</a:displayName>
                            <a:help>Campo de notas privadas del perfil de usuario en OJS.</a:help>
                            <a:displayOrder>820</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="signature" type="xsd:string" minOccurs="0">
                         <xsd:annotation><xsd:appinfo>
                            <a:displayName>Firma (OJS)</a:displayName>
                            <a:help>Firma de correo electrónico del usuario en OJS.</a:help>
                            <a:displayOrder>830</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="preferredPublicName" type="xsd:string" minOccurs="0">
                         <xsd:annotation><xsd:appinfo>
                            <a:displayName>Nombre Público Preferido (OJS)</a:displayName>
                            <a:displayOrder>840</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                </xsd:sequence>
            </xsd:complexType>
            
            <xsd:complexType name="dspaceCris">
                <xsd:annotation>
                    <xsd:appinfo>
                        <a:extension ref="c:UserType"/>
                        <a:displayName>Atributos de DSpace/CRIS</a:displayName>
                        <a:displayOrder>900</a:displayOrder>
                    </xsd:appinfo>
                </xsd:annotation>
                <xsd:sequence>
                    <xsd:element name="crisInternalId" type="xsd:string" minOccurs="0">
                         <xsd:annotation><xsd:appinfo>
                            <a:displayName>ID Interno CRIS</a:displayName>
                            <a:help>El ID interno del perfil de investigador en el sistema CRIS.</a:help>
                            <a:displayOrder>910</a:displayOrder>
                            <a:indexed>true</a:indexed>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="epersonId" type="xsd:string" minOccurs="0">
                         <xsd:annotation><xsd:appinfo>
                            <a:displayName>ID de EPerson (DSpace)</a:displayName>
                            <a:help>El ID del objeto EPerson en DSpace.</a:help>
                            <a:displayOrder>920</a:displayOrder>
                            <a:indexed>true</a:indexed>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                </xsd:sequence>
            </xsd:complexType>

            <xsd:complexType name="indico">
                <xsd:annotation>
                    <xsd:appinfo>
                        <a:extension ref="c:UserType"/>
                        <a:displayName>Atributos de Indico</a:displayName>
                        <a:displayOrder>1000</a:displayOrder>
                    </xsd:appinfo>
                </xsd:annotation>
                <xsd:sequence>
                    <xsd:element name="indicoUserId" type="xsd:string" minOccurs="0">
                         <xsd:annotation><xsd:appinfo>
                            <a:displayName>ID de Usuario (Indico)</a:displayName>
                            <a:displayOrder>1010</a:displayOrder>
                            <a:indexed>true</a:indexed>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                    <xsd:element name="avatarUrl" type="xsd:anyURI" minOccurs="0">
                         <xsd:annotation><xsd:appinfo>
                            <a:displayName>URL del Avatar (Indico)</a:displayName>
                            <a:displayOrder>1020</a:displayOrder>
                        </xsd:appinfo></xsd:annotation>
                    </xsd:element>
                </xsd:sequence>
            </xsd:complexType>
            
        </xsd:schema>
    </definition>
</schema>
