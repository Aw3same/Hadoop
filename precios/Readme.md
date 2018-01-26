# Ingesta de precios de combustible en tiempo real

``` 
cd $HOME/Hadoop/precios
``` 

## Obtención de datos

``` 
get_data.sh \
    --name ccaa \
    --dir data \
    https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/Listados/ComunidadesAutonomas/ 

hadoop fs -rm -r /raw/ccaa
hadoop fs -mkdir -p /raw/ccaa
hadoop fs -put data/ccaa.json /raw/ccaa

./download_precios.sh

beeline -u jdbc:hive2:// -f tablas.hql

``` 

## Planificación

https://crontab.guru/

```
crontab -e
```

0 * * * * /home/cloudera/Hadoop/precios/download_precios.sh


## Ingesta en tiempo real

```
flume-ng agent -f ingest-precios.conf -n agente
``` 

