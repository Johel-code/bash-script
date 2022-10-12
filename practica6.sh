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
        echo "Numero de parametros incorrecto"
        echo "Ejecuta -h o --help para tener ayuda"
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
                iniAux=$(echo $line | awk '{print $1}') 
                finAux=$(echo $line | awk '{print $2}')
                nomAct=$(echo $line | awk '{print $3}')
                if [ $1 -ge $iniAux -a $2 -le $finAux ]
                then
                    echo "Cita no disponible en ese rango de hora"    
                    exit 1
                fi
                if [[ "$3" == "$nomAct" ]]
                then
                    echo "Nombre de pasciente ya registrado"
                    exit 1
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

}
function search(){

    if [ $# -ne 1 ]
    then 
        echo "Numero de parametros incorrecto"
        echo "Ejecuta -h o --help para tener ayuda"
        exit 1
    fi
    grep "$1" ./citas.txt

}
function init(){
    awk '{print $1}' ./citas.txt | grep "^$1$"
}
function end(){
    if [ $# -ne 1 ]
    then 
        help
        exit 1
    fi
    es_numero='^[0-9]+$'
    if ! [[ $1 =~ $es_numero ]] 
    then
        echo "ERROR: Debe introducir  un numero"
        exit 1
    fi
    if [ $1 -lt 1 -o $1 -gt 23 ]
    then
        echo "El parametro debe estar entre el rango [1-23]"
        exit 1
    fi
    awk '$2 ~/'"$1"'/ {print $0}' citas.txt
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
            ADD="$2 $3 $4"
            add $2 $3 $4
            shift
            shift
            shift
            shift
            ;;
        -s|--search)
            SEARCH="$2"
            search $2
            shift
            shift
            ;;
        -i|--init)
            INIT="$2"
            init $2
            shift
            shift
            shift
            ;;
        -e|--end)
            END="$2"
            end $2
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
