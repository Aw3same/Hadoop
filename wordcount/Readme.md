# WordCount con MapReduce

```
cd $HOME/Hadoop/wordcount
```

## Ingesta
```
tar xvf data/shakespeare.tar.gz
hadoop fs -put shakespeare shakespeare
```

## Proceso

mvn package

hadoop jar target/wordcount-1.0-SNAPSHOT.jar MyWordCount shakespeare output