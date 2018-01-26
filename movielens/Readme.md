# MovieLens

```
cd $HOME/Hadoop/movielens
gunzip data/movielens.sql.gz
mysql -u root -pcloudera < data/movielens.sql
```

## Ingesta de la información

```
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
--m 1 \
--username root \
--password cloudera \
--target-dir /raw/movielens/movie

sqoop import \
--connect jdbc:mysql://localhost/movielens \
--table movierating --fields-terminated-by '\t' \
--m 1 \
--username root \
--password cloudera \
--target-dir /raw/movielens/movierating
```

## Proceso

```
beeline -u jdbc:hive2:// -f create_tables.hql

hadoop fs -put users users

mahout recommenditembased \
    --similarityClassname SIMILARITY_EUCLIDEAN_DISTANCE \
    --input /raw/movielens/movierating \
    --output recs \
    --usersFile users

pig listrecommendations.pig
```

## Acceso a MySQL

```
mysql -u root -pcloudera movielens
```

