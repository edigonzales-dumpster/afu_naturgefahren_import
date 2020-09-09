# afu_naturgefahren_import

## TODO
- Mögliches Problem: Daten können nicht importiert werden, da zu grobe Fehler für ili2pg.
- Permissions (postscript.sql)
- Woher kommen die neuen Daten? Geopackage oder sollen sie in die Work-PG-Database importiert werden. Bei GPKG wohl sinnvoll, wenn die ili2db-Parameter übereinstimmen.
- Umgang mit t_id? to_work mit t_id from_work ohne geht nicht, wegen Beziehungen. Ah doch, da gleiche DB. Beim Rüberspielen einfach nextval().

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

Grundidee: Initial wird jedes ITF als Dataset importiert. Beim Kopieren in das Work-Schema wird 1-n Dataset in ein (1) ITF exportiert und importiert. Dort wird das geändert was geändert werden muss. Anschliessend wird es wieder exportiert. Dann müssen die 1-n Dataset gelöscht werden (--delete) und das neue Dateset importiert werden. -> Nach ein paar Mutationen gibt es nur noch ein riesiges Dataset? Wo ist der Haken? 


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