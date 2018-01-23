#!/bin/bash

sudo -u hdfs hadoop fs -mkdir /user/cloudera/accesslog
sudo -u hdfs hadoop fs -copyFromLocal /opt/examples/log_files/access.log.2 /user/cloudera/accesslog