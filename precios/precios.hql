DROP TABLE IF EXISTS precios.precio_combustible;

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
ROW FORMAT SERDE 'com.cloudera.hive.serde.JSONSerDe'
LOCATION '/raw/precios';

select * from precios.precio_combustible 
limit 10;