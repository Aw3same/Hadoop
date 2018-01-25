#!/bin/bash

spark-submit --packages \
      org.apache.spark:spark-streaming-kafka-0-8_2.11:2.2.1 \
      kafka_wordcount.py \
      localhost:2181 pyspark
