#!/bin/bash

export PYTHONIOENCODING=utf8

spark-submit  --conf "spark.mongodb.input.uri=mongodb://127.0.0.1/test.myCollection?readPreference=primaryPreferred" \
        --conf "spark.mongodb.output.uri=mongodb://127.0.0.1/test.myCollection" \
        --packages org.mongodb.spark:mongo-spark-connector_2.10:1.1.0 \
        $1