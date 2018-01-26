CREATE EXTERNAL TABLE movie (
    id INT, 
    name STRING, 
    year INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/raw/movielens/movie';

CREATE EXTERNAL TABLE movierating (
    userid INT, 
    movieid INT, 
    rating INT
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/raw/movielens/movierating';