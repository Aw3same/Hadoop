#!/bin/bash

flume-ng agent -f ingest-precios.conf -n flume-hive-ingest 
