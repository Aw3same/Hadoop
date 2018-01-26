#!/bin/bash

hadoop fs -put users users

mahout recommenditembased \
    --similarityClassname SIMILARITY_EUCLIDEAN_DISTANCE \
    --input /raw/movielens/movierating \
    --output recs \
    --usersFile users