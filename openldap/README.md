# Cargar Schemas para los metadatos al Servidor OpenLDAP

Cargaremos los schemas upeuSchema, eduPerson y SCHAC al servidor OpenLdap

## Referencia de repositorio de esquemas:

upeuSchema

[](https://github.com/UPeU-CRAI/upeuschema/tree/main/schema/openldap)

eduPerson

[](https://github.com/REFEDS/eduperson/tree/master/schema/openldap)

y SCHAC

[](https://github.com/REFEDS/SCHAC/tree/main/schema)

# Desc**argar  los esquemas**  EduPerson y SCHAC **a la capeta /tmp del servidor openLDAP**

Ingresar al servidor de openLdap por consola (Ingresar al contenedor)

```bash
docker exec -it openldap_server /bin/bash
```

Dentro del contenedor de openLdap descargar los archivos LDIF de los esquemas, 

```bash
cd /tmp && \
wget https://raw.githubusercontent.com/UPeU-CRAI/upeuschema/main/schema/openldap/upeuschema.ldif && \
wget https://raw.githubusercontent.com/REFEDS/eduperson/master/schema/openldap/eduperson.ldif && \
wget https://raw.githubusercontent.com/REFEDS/SCHAC/main/schema/openldap.ldif
```

# Cargar los esquemas descargados a openLDAP

```bash
ldapadd -Y EXTERNAL -H ldapi:/// -f upeuschema.ldif && \
ldapadd -Y EXTERNAL -H ldapi:/// -f eduperson.ldif && \
ldapadd -Y EXTERNAL -H ldapi:/// -f openldap.ldif
```

Finalmente Actualizar clientes para poder usar los nuevos esquemas:

[LDAP attributes and associated fields - Documentation for BMC FootPrints Service Core 12.1 - BMC Documentation](https://docs.bmc.com/docs/fpsc121/ldap-attributes-and-associated-fields-495323340.html)

