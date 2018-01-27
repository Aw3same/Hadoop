# Procesado de información con Spark Graph

## Ingesta de datos
```
cd $HOME/Hadoop/graphx

hadoop fs -rm -r /raw/graph
hadoop fs -mkdir -p /raw/graph
hadoop fs -put data/metadata-raw.txt /raw/graph
```

## Procesado de información

spark-submit --master local \
  --class GraphExample \
  /home/cloudera/Hadoop/graphx/target/graphx-example-1.0-SNAPSHOT.jar 
