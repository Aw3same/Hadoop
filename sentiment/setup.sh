#!/bin/bash

hadoop fs -rm -r /config/sentiment
hadoop fs -mkdir -p /config/sentiment
hadoop fs -put data /config/sentiment