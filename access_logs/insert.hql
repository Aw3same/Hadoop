--ADD JAR /usr/lib/hive/lib/hive-contrib.jar;

INSERT OVERWRITE TABLE logs.tokenized_access_logs 
SELECT * FROM logs.intermediate_access_logs;