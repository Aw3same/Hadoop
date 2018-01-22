CREATE DATABASE precios;

DROP TABLE IF EXISTS precios.ComunidadesAutonomas;

CREATE EXTERNAL TABLE precios.ComunidadesAutonomas ( 
    CCAA STRING, 
    IDCCAA STRING
) 
ROW FORMAT SERDE 'com.cloudera.hive.serde.JSONSerDe'
--ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION '/raw/ccaa';

select * from precios.ComunidadesAutonomas