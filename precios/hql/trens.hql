with data as (
    SELECT created_at,
        explode(locations) as locations,
        trends
    FROM raw_trends
), data2 as (
    select created_at,locations.name as location, explode(trends) as trend
    from data
), data3 as (
select substr(created_at, 1, 10) as dia,
    location, 
    trend.name,
    trend.tweet_volume as volumen,
    explode(camel_split(trend.name)) as word
from data2
), data4 as (
    select dia, 
        volumen, 
        word,
        row_number() over (partition by dia, word order by volumen desc) as index
    from data3
) 
select dia, volumen, word
from data4
where index = 1 and word <> ''