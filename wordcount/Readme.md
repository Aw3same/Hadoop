# WordCount con MapReduce

```
cd $HOME/Hadoop/wordcount
```

## Ingesta de la información
```
tar xvf data/shakespeare.tar.gz
hadoop fs -put shakespeare shakespeare
```

## Proceso con MapReduce (Java)

```
mvn package

hadoop jar target/wordcount-1.0-SNAPSHOT.jar MyWordCount shakespeare output
```

## Proceso con MapReduce (Python)

```
cd $HOME/Hadoop/wordcount/python

hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar \
    -input shakespeare \
    -output output_dir \
    -mapper mapper.py \
    -reducer reducer.py \
    -file ./mapper.py \
    -file ./reducer.py
```
