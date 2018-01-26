from pyspark.sql import HiveContext
from pyspark import SparkContext

sc = SparkContext(appName = "Precios")
log4jLogger = sc._jvm.org.apache.log4j 
log = log4jLogger.LogManager.getLogger(__name__) 


log.warn("Precios Diesel")

sqlContext = HiveContext(sc)
results = sqlContext.sql("""
    with data_convert as (
    select 
        ideess,
        substr(fecha, 1, 10) as dia,
        cast(fecha as timestamp) as fecha,
        rotulo,
        horario,
        remision,
        precio_gasoleo_a,
        lag(precio_gasoleo_a) over (partition by ideess order by fecha asc) as precio_ant,
        precio_nuevo_gasoleo_a,
        precio_gasolina_95_proteccion
    from precios
), data_raw as (
    select 
        ideess,
        dia,
        hour(fecha) as hora,
        upper(rotulo) as rotulo,
        upper(horario) as horario,
        remision,
        precio_gasoleo_a as precio,
        precio_ant,
        precio_nuevo_gasoleo_a as precio_premium,
        precio_gasolina_95_proteccion as precio_gasolina_95,
        case when precio_ant is null then null
             when precio_gasoleo_a = precio_ant then 0
            else 1
        end as ind_cambio,
        fecha
    from data_convert
), data as (
    select *,
        row_number() over (partition by ideess, dia, hora order by ind_cambio desc, fecha desc) as index
    from data_raw
)
select ideess,
        dia,
        hora,
        rotulo,
        horario,
        remision,
        precio,
        precio_ant,
        lead(precio) over (partition by ideess order by fecha asc) as precio_sig,
        precio_premium,
        precio_gasolina_95,
        ind_cambio,
        fecha
from data where index = 1
    """)

results.registerTempTable("diesel_data")

sqlContext.sql("""
    insert overwrite table diesel 
    select * from diesel_data
    """)



log.warn("Estaciones")

sqlContext = HiveContext(sc)
results = sqlContext.sql("""
with max_iddee as (
    select ideess, max(fecha) as fecha
    from precios
    group by ideess
)
select precios.ideess,
    precios.cp,
    precios.direccion,
    precios.id_ccaa,
    precios.id_municipio,
    precios.id_provincia,
    precios.provincia,
    precios.localidad,
    precios.latitud,
    precios.longitud,
    precios.margen,
    precios.municipio,
    precios.horario,
    precios.rotulo,
    precios.remision,
    precios.fecha
from precios 
inner join max_iddee on (
    precios.ideess = max_iddee.ideess and 
    precios.fecha = max_iddee.fecha)
    """)

results.registerTempTable("estaciones_data")

sqlContext.sql("""
    insert overwrite table estaciones 
    select * from estaciones_data
    """)


log.warn("Cambios de Precio")

sqlContext = HiveContext(sc)
results = sqlContext.sql("""
with data as (
    select ideess,
        dia,
        sum(ind_cambio) as num_cambios_dia
    from diesel
    group by ideess, dia
)
select ideess,
    max(num_cambios_dia) as max_cambios,
    min(num_cambios_dia) as min_cambios,
    avg(num_cambios_dia) as avg_cambios
from data
group by ideess
    """)

results.registerTempTable("estaciones_cambios_data")

sqlContext.sql("""
    insert overwrite table estaciones_cambios 
    select * from estaciones_cambios_data
    """)

log.warn("Done")