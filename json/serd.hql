-- https://stackoverflow.com/questions/25149700/loading-json-file-with-serde-in-cloudera

create database json;

-- hadoop fs -mkdir /ingest/json
-- hadoop fs -put data.json /ingest/json

CREATE EXTERNAL TABLE IF NOT EXISTS json.serd (
           user_id string, 
           type string, 
           title string,
           year string,
           publisher string,
           authors array<struct<name:string>>,
           source string)       
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION '/ingest/json';
    
select * from json.serd;