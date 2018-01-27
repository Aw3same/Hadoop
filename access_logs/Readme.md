# Logs de un servidor web

```
cd $HOME/Hadoop/access_logs
hadoop fs -rm -r /raw/logs
hadoop fs -mkdir -p /raw/logs
hadoop fs -put data/access_log /raw/logs

hadoop fs -ls /raw/logs

beeline -u jdbc:hive2:// -f logs.hql
```

## Ingesta en tiempo real
```
flume-ng agent -f ingest-log-access.conf -n agent1
```

## Proceso de inserción de datos
```
beeline -u jdbc:hive2:// -f insert.hql
```

## Logs

```
tail -f /opt/gen_logs/logs/access.log
```

| Acción  | Comando |
| ------------- | ------------- | 
| Iniciar | start_logs |
| Verificar | tail_logs |
| Parar | stop_logs |

## Acceso a la información

```
impala-shell -f query.hql
```