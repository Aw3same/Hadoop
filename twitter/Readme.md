# Ingesta de datos de twitter en tiempo real

## Ingesta de datos

```
flume-ng agent -f ingest-twitter.conf -n TwitterAgent
```


## Proceso

```
beeline -u jdbc:hive2:// -f tablas.hql

```

## Acceso a la información

```
beeline -u jdbc:hive2:// -f most_influent.hql
```