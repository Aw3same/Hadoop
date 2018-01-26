#!/bin/bash

sqoop list-databases \
--connect jdbc:mysql://localhost \
--username root \
--password cloudera

sqoop list-tables \
--connect jdbc:mysql://localhost/movielens \
--username root \
--password cloudera 

sqoop import \
--connect jdbc:mysql://localhost/movielens \
--table movie --fields-terminated-by '\t' \
--username root \
--password cloudera \
--target-dir /raw/movielens/movie

sqoop import \
--connect jdbc:mysql://localhost/movielens \
--table movierating --fields-terminated-by '\t' \
--username root \
--password cloudera \
--target-dir /raw/movielens/movierating