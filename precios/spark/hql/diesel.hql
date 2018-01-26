insert overwrite table precios.diesel 
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
    from precios.precio_combustible
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
        precio_premium,
        precio_gasolina_95,
        ind_cambio,
        fecha
from data where index = 1