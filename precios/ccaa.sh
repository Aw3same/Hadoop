#!/bin/bash

get_data.sh \
    --name ccaa \
    --dir data \
    https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/Listados/ComunidadesAutonomas/ 

hadoop fs -rm /raw/ccaa/ccaa.json
hadoop fs -mkdir -p /raw/ccaa
hadoop fs -put data/ccaa.json /raw/ccaa
