#!/bin/bash

get_data.sh \
    --dir data/precios \
    --item ListaEESSPrecio \
    --timestamp \
    https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/

