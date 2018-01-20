-- hadoop fs -mkdir /ingest/ComunidadesAutonomas
-- hadoop fs -put ComunidadesAutonomas.json /ingest/ComunidadesAutonomas


-- https://bigdatadevelop.wordpress.com/2015/01/02/working-with-json-files-in-hive/
-- https://github.com/rcongiu/Hive-JSON-Serde

-- /usr/lib/hive/lib/
-- sudo mv json-serde-1.3.6-SNAPSHOT-jar-with-dependencies.jar /usr/lib/hive/lib/

create database msmk;

ADD JAR /usr/lib/hive/lib/hive-serdes-1.0-SNAPSHOT.jar;
ADD JAR /usr/lib/hive/lib/json-serde-1.3.6-SNAPSHOT-jar-with-dependencies.jar;

DROP TABLE msmk.ComunidadesAutonomas;

CREATE EXTERNAL TABLE msmk.ComunidadesAutonomas ( 
    CCAA STRING, 
    IDCCAA STRING
) 
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
--ROW FORMAT SERDE 'com.cloudera.hive.serde.JSONSerDe'
LOCATION '/ingest/ComunidadesAutonomas';

-- select * from msmk.ComunidadesAutonomas