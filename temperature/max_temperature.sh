#!/bin/bash

#hadoop fs -put /home/cloudera/training/data/ncdc /ingest

hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar \
    -input /ingest/ncdc/all \
    -output max_temperatures_dir \
    -mapper max_temperature_map.py \
    -reducer max_temperature_reduce.py \
    -file ./max_temperature_map.py \
    -file ./max_temperature_reduce.py