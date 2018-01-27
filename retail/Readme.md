# Base de datos de Retail

## Ingesta de datos
```
cd $HOME/Hadoop/retail

sqoop --options-file import-all-dbretail.conf

beeline -u jdbc:hive2:// -f top10.hql
```

## Proceso

```
beeline -u jdbc:hive2:// -f query.hql
```

## Exportación de datos 
```
mysql -u retail_dba -pcloudera < mysql_top10.sql

sqoop --options-file truncate-table.conf
sqoop --options-file export-top10.conf
```

## Acceso a MySQL

```
mysql -u retail_dba -pcloudera retail_db -e "select * from top10"
```
