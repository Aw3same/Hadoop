 -- mysql -u retail_dba -pcloudera < mysql_top10.sql

use retail_db;

-- drop table retail_db.top10;

create table retail_db.top10 (
    product_id int,
    product_name varchar(200),
    revenue double
);