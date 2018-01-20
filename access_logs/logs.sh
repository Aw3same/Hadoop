#!/bin/bash

#export CLASSPATH=$CLASSPATH:/usr/lib/flume-ng/lib

flume-ng agent -f ingest-log-access.conf -n agent1