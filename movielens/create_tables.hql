DROP TABLE IF EXISTS movielens.movie;
DROP TABLE IF EXISTS movielens.movierating;
DROP DATABASE IF EXISTS movielens;

CREATE DATABASE movielens;

CREATE EXTERNAL TABLE movielens.movie (
    id INT, 
    name STRING, 
    year INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/raw/movielens/movie';

CREATE EXTERNAL TABLE movielens.movierating (
    userid INT, 
    movieid INT, 
    rating INT
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/raw/movielens/movierating';