#!/bin/bash
# Autor: Johel Saavedra
# Script: Practica6 (parametros)
# Fecha: Octubre 2022

function help(){
    echo "Ayuda"
}
function add(){

    if [ $# -ne 3 ]
    then 
        help
        exit 1
    fi

    if [ ! -f "./citas.txt" ]
    then
        touch citas.txt
    fi 

    if [[ $1 -ge 0 && $1 -le 23 && $2 -ge 0 && $2 -le 23 ]]
    then
        if [ $2 -gt $1 ]
        then
            while IFS= read line
            do
                iniAux="$line"
                if []
                then
                else
                fi
            done < citas.txt
        else
            echo "La hora de finalizacion de la cita debe ser despues de la hora de inicio"
            exit 1
        fi
    else
        echo "Las horas deben ser numeros enteros y estar comprendidas entre 0 y 23"
        help
        exit 1
    fi
    
    echo "$1 $2 $3" >> "./citas.txt"
    cat citas.txt

}
function search(){
    echo buscando        
}

while [[ $# -gt 0 ]]
do
    key="$1"

    case "$key" in
        -h|--help)
            help
            exit
            ;;
        -a|--add)
            add $2 $3 $4
            shift
            shift
            shift
            shift
            ;;
        -s|--search)
            SEARCH="$2"
            search
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
