# Procesamiento de datos en tiempo real

## Infraestructura

```
kafka-server-start.sh $KAFKA_HOME/config/server.properties
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic flume
```

## Ingesta de la información

```
flume-ng agent -f kafka-sink.conf -n agente
```

## Generación de la información
```
telnet localhost 9999
cat data/bigdata.txt | nc localhost 9999
```
 
## Procesado de la información
```
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic flume --from-beginning
```

## Spark Streaming
```
spark-submit --packages \
      org.apache.spark:spark-streaming-kafka-0-8_2.11:2.2.1 \
      kafka_wordcount.py \
      localhost:2181 flume
```