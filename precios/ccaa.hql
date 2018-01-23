CREATE DATABASE precios;

DROP TABLE IF EXISTS precios.ComunidadesAutonomas;

CREATE EXTERNAL TABLE precios.ComunidadesAutonomas ( 
    CCAA STRING, 
    IDCCAA STRING
) 
ROW FORMAT SERDE 'com.cloudera.hive.serde.JSONSerDe'
LOCATION '/raw/ccaa';

select * from precios.ComunidadesAutonomas