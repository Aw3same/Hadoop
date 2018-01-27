# Procesamiento de Trendings Topics de Twitter

## Ingesta de la información

```
cd $HOME/Hadoop/trends

gunzip data/twitter-trends.json.gz

hadoop fs -rm -r /raw/trends
hadoop fs -mkdir -p /raw/trends
hadoop fs -put data/twitter-trends.json /raw/trends
```

## Procesamiento con Spark

```
export PYTHONIOENCODING=utf8

spark-submit  --conf "spark.mongodb.input.uri=mongodb://127.0.0.1/twitter.trends?readPreference=primaryPreferred" \
        --conf "spark.mongodb.output.uri=mongodb://127.0.0.1/twitter.trends" \
        --packages org.mongodb.spark:mongo-spark-connector_2.10:1.1.0 \
        export_trends.py
```