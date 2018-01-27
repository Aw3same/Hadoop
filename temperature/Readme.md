# Obtención de la temperatura máxima anual

## Ingesta de la información

```
cd $HOME/Hadoop/temperature

hadoop fs -rm -r /raw/ncdc
hadoop fs -put data/ncdc /raw
```

## Procesamiento en local 

```
cat data/ncdc/sample/sample.txt | \
    python max_temperature_map.py | \
    sort | \
    python max_temperature_reduce.py
```


## Procesamiento con Hadoop utilizando Python

```
hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar \
    -input /raw/ncdc/all \
    -output max_temperatures_dir \
    -mapper max_temperature_map.py \
    -reducer max_temperature_reduce.py \
    -file ./max_temperature_map.py \
    -file ./max_temperature_reduce.py
```