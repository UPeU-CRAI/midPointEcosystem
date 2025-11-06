# Paso 1: Extender el esquema de Midpoint
Para ampliar el esquema, simplemente copie el archivo schema-extensibility-upeu.xsd en la siguiente ruta del servidor MidPoint:
`/opt/midpoint/var/schema`

### Proceso

```bash
docker exec -it midpoint_server /bin/bash
```

```bash
cd /opt/midpoint/var/schema
```

```bash
wget https://raw.githubusercontent.com/UPeU-CRAI/midPointEcosystem/main/initial-objects/schema-extensibility-upeu.xsd
```

resetear el contenedor Docker de MidPoint:

```bash
exit

docker restart midpoint_server
```

# Paso 2: Crear resources de los conectores
Para crear los resources rápidamente se puede importar plantillas de configuración XML como objetos en Midpoint:  
ADMINISTRATION -> Resoures -> Import Resources definition, Seleccionar Embedder editor y pegar el código del resource correspondiente.
![Captura de pantalla 2024-08-19 a la(s) 4 43 01 p  m](https://github.com/user-attachments/assets/3f087b78-ca0a-4114-bfba-55123147b029)


# Paso 3: Crear roles
Para crear los roles rápidamente se puede importar plantillas de configuración XML como objetos en Midpoint:  
ADMINISTRATION -> Resoures -> Import Resources definition, Seleccionar Embedder editor y pegar el código del rol correspondiente.  
Luego podemos ver los roles en: ADMINISTRATION -> Roles -> All Roles
![Captura de pantalla 2024-08-19 a la(s) 5 00 48 p  m](https://github.com/user-attachments/assets/cc203d79-792a-4393-989a-469093b6276d)
