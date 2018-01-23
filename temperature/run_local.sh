#!/bin/bash

cat data/ncdc/sample/sample.txt | \
    python max_temperature_map.py | \
    sort | \
    python max_temperature_reduce.py