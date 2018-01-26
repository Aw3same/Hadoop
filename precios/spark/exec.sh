#!/bin/bash

export PYTHONIOENCODING=utf8

spark-submit  --conf "spark.mongodb.input.uri=mongodb://127.0.0.1/test.myCollection?readPreference=primaryPreferred" \
        --conf "spark.mongodb.output.uri=mongodb://127.0.0.1/test.myCollection" \
        --jars /home/cloudera/cdh-twitter-example/hive-serdes/target/hive-serdes-1.0-SNAPSHOT.jar \
        --driver-library-path hive-serdes-1.0-SNAPSHOT.jar \
        --conf spark.executor.extraLibraryPath=hive-serdes-1.0-SNAPSHOT.jar \
        --packages org.mongodb.spark:mongo-spark-connector_2.10:1.1.0 \
        $1