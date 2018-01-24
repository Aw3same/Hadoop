#!/bin/bash

hadoop fs -rm -r sentiment

hadoop jar target/sentiment-1.0-SNAPSHOT.jar org.myorg.MrManager /raw/flume/events \
    /user/cloudera/sentiment/output \
    -skip /config/sentiment/data/stop-words.txt \
    -pos /config/sentiment/data/pos-words.txt \
    -neg /config/sentiment/data/neg-words.txt \
    -no_case