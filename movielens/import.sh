#!/bin/bash

gunzip data/movielens.sql.gz
mysql -u root -pcloudera < data/movielens.sql