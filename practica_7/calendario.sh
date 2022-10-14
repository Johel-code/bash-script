#!/bin/bash
# Autor: Johel Saavedra
# Script: Practia 7 ASO
# Fecha: Octubre de 2022


function help(){
    echo "Usage: [OPTION]...

    Script Calendario 
    
    Interpretacion de opciones
        -h, --help      Mostrar texto de ayuda y salir
        -c, --corta     Muestra la fecha con el formato dia/MES/ANIO
        -l, --larga     Muestra la fecha con formato largo"
}

function corta(){
    date +"%d/%B/%Y"
}

function larga(){
    date +"Hoy es el dia %A del mes de %B del anio %Y"
}


if [ $# -eq 0 ]
then
    cal
elif [ $# -eq 1 ]
then
    key="$1"

    case "$key" in
        -h|--help)
            help
            exit
            ;;
        -c|--corta)
            corta
            ;;
        -l|--larga)
            larga
            ;;
        *)
            echo "Opcion incorrecta"
            exit 2      
            ;;
    esac
else
    echo "Error: solo se admite un parametro"
    exit 1
fi


