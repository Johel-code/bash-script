#!/bin/bash
# Autor: Johel Saavedra
# Script: Practica6 (parametros)
# Fecha: Octubre 2022

function help(){
    echo "Ayuda"
}
function search(){
    
}

while [[ $# -gt 0]]
do
    key="$1"

    case "$key" in
        -h|--help)
            help
            exit
            ;;
        -a|--add)
            ADD="$2, $3, $4"
            shift
            shift
            shift
            shift
            ;;
        -s|--search)
            SEARCH="$2"
            shift
            shift
            ;;
        -i|--init)
            INIT="$2"
            shift
            shift
            ;;
        -e|--end)
            END="$2"
            shift
            shift
            ;;
        -n|--name)
            NAME="$2"
            shift
            shift
            ;;
        -o|--hour)
            HOUR="$2"
            shift
            shift
            ;;
        *)
            echo "ERROR: parametro desconocido"
            help
            exit 1
            ;;
    esac
done
