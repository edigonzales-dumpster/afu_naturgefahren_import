# afu_naturgefahren_import

## TODO
- Mögliches Problem: Daten können nicht importiert werden, da zu grobe Fehler für ili2pg.
- Permissions (postscript.sql)
- Woher kommen die neuen Daten? Geopackage oder sollen sie in die Work-PG-Database importiert werden. Bei GPKG wohl sinnvoll, wenn die ili2db-Parameter übereinstimmen.

## Dev-DB hochfahren
```
docker-compose up edit-db
```

## Schema in Edit-DB inkl. Zusatzspalte

```
java -jar /usr/local/ili2pg-4.3.1/ili2pg.jar \
--dbschema afu_naturgefahren --models Naturgefahrenkarte_SO_V11 \
--defaultSrsCode 21781 --createGeomIdx --createFk --createFkIdx --createUnique --createEnumTabs --beautifyEnumDispName --createMetaInfo --createNumChecks --nameByTopic --strokeArcs \
--createscript afu_naturgefahren.sql
```

Siehe `afu_naturgefahren_alter_table.sql`. Manuell geschrieben.

## Work-Schema in Edit-DB 

```
java -jar /usr/local/ili2pg-4.3.1/ili2pg.jar \
--dbschema afu_naturgefahren_work --models Naturgefahrenkarte_SO_V11 \
--defaultSrsCode 21781 --createGeomIdx --createFk --createFkIdx --createUnique --createEnumTabs --beautifyEnumDispName --createMetaInfo --createNumChecks --nameByTopic --strokeArcs \
--createscript afu_naturgefahren_work.sql
```

## TEMP TEMP: Testen mit build-in-feature approach

```
java -jar /usr/local/ili2pg-4.3.1/ili2pg.jar \
--dbschema afu_naturgefahren --models Naturgefahrenkarte_SO_V11 \
--defaultSrsCode 21781 --createGeomIdx --createFk --createFkIdx --createUnique --createEnumTabs --beautifyEnumDispName --createMetaInfo --createNumChecks --nameByTopic --strokeArcs \
--createBasketCol --createDatasetCol \
--createscript afu_naturgefahren_enablenull.sql
```

```
java -jar /usr/local/ili2pg-4.3.1/ili2pg.jar \
--dbhost localhost --dbport 54321 --dbdatabase edit --dbusr admin --dbpwd admin \
--dbschema afu_naturgefahren --models Naturgefahrenkarte_SO_V11 \
--dataset master \
--import gkso11_balsthal_rutsch_20091222.itf
```

```
java -jar /usr/local/ili2pg-4.3.1/ili2pg.jar \
--dbhost localhost --dbport 54321 --dbdatabase edit --dbusr admin --dbpwd admin \
--dbschema afu_naturgefahren --models Naturgefahrenkarte_SO_V11 \
--dataset master \
--import gkso11_balsthal_sturz_20200324.itf
```