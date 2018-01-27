# Procesamiento con Spark

## Ingesta de la información

```
hadoop fs -rm -r shakespeare.txt
hadoop fs -put data/shakespeare.txt
```

## Procesamiento de forma interactiva con Spark 

```
spark-shell
pyspark
```

## Obtención de la temperatura maxima anual

```
spark-submit max_temperature.py /raw/ncdc/all spark_python_max_temp
```

## Procesamiento de forma interactiva con Jupyter (y Spark!) 

```
./start_jupyter.sh
```