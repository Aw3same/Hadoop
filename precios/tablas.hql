ADD JAR /home/cloudera/cdh-twitter-example/hive-serdes/target/hive-serdes-1.0-SNAPSHOT.jar;

DROP DATABASE IF EXISTS precios CASCADE;

CREATE DATABASE precios;

CREATE EXTERNAL TABLE precios.precio_combustible (
    `Provincia` STRING,
    `Precio Biodiesel` STRING,
    `Precio Bioetanol` STRING,
    `% BioEtanol` STRING,
    `IDProvincia` STRING,
    `Precio Gas Natural Comprimido` STRING,
    `IDCCAA` STRING, 
    `Precio Gasoleo A` STRING,
    `Precio Gasoleo B` STRING,
    `% Éster metílico` STRING,
    `Precio Nuevo Gasoleo A` STRING,
    `IDMunicipio` STRING,
    `Tipo Venta` STRING,
    `IDEESS` STRING,
    `Precio Gasolina  98` STRING,
    `Municipio` STRING,
    `Precio Gases licuados del petróleo` STRING,
    `C_P_` STRING,
    `Rótulo`  STRING,
    `Dirección` STRING,
    `Localidad` STRING,
    `Remisión` STRING,
    `Latitud` STRING,
    `Precio Gasolina 95 Protección` STRING,
    `Longitud (WGS84)` STRING,
    `Precio Gas Natural Licuado` STRING,
    `Horario` STRING,
    `Margen` STRING,
    `_timestamp` STRING
) 
ROW FORMAT SERDE 'com.cloudera.hive.serde.JSONSerDePlus'
LOCATION '/raw/precios';


CREATE EXTERNAL TABLE precios.ComunidadesAutonomas ( 
    CCAA STRING, 
    IDCCAA STRING
) 
ROW FORMAT SERDE 'com.cloudera.hive.serde.JSONSerDePlus'
LOCATION '/raw/ccaa';


CREATE TABLE diesel (
    ideess string, 
    dia string, 
    hora int, 
    rotulo string, 
    horario string, 
    remision string, 
    precio decimal(5,3), 
    precio_ant decimal(5,3), 
    precio_sig decimal(5,3), 
    precio_premium decimal(5,3), 
    precio_gasolina_95 decimal(5,3), 
    ind_cambio int, 
    fecha timestamp)
ROW FORMAT SERDE 'parquet.hive.serde.ParquetHiveSerDe'
 STORED AS
 INPUTFORMAT 'parquet.hive.DeprecatedParquetInputFormat'
 OUTPUTFORMAT 'parquet.hive.DeprecatedParquetOutputFormat'
LOCATION 'hdfs://quickstart.cloudera:8020/user/hive/warehouse/diesel'
;