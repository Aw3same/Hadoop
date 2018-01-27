# Analisis de sentimiento con MapReduce

## Compilación de las clases java y configuración inicial
```
cd $HOME/Hadoop/sentiment

hadoop fs -rm -r /config/sentiment
hadoop fs -mkdir -p /config/sentiment
hadoop fs -put data /config/sentiment

mvn package
```

## Ingesta de la información (Prueba)
```
flume-ng agent -f red.conf -n agente

cat input.txt | nc localhost 9999
```

## Ingesta de la información
```
flume-ng agent -f flume.conf -n agente

cat input.txt | nc localhost 9999
```


## Procesado de la información
```
hadoop fs -rm -r sentiment

hadoop jar target/sentiment-1.0-SNAPSHOT.jar org.myorg.MrManager /raw/flume/events \
    /user/cloudera/sentiment/output \
    -skip /config/sentiment/data/stop-words.txt \
    -pos /config/sentiment/data/pos-words.txt \
    -neg /config/sentiment/data/neg-words.txt \
    -no_case
```