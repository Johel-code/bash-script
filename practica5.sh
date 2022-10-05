#!/bin/bash
#Autor: Johel Saavedra
#Script: Practica 5 ASO
#Fecha: Septiembre 2022

if [ $# -ne 1 ]; then
    echo Uso: >&2
    echo $0 fichero_de_notas >&2
    exit
fi

suspensos=$(cat $1 | grep "no apto" | wc -l)
presentados=$(cat $1 | wc -l)
aprobados=$(($presentados - $suspensos))

logins=$(cat $1 | cut -d' ' -f1)

for login in $logins
do
    su_nota=$(grep $login $1)
    estadisticas="Presentados: $presentados, Aprobados: $aprobados"
    echo $su_nota. $estadisticas | mail $login@pantuflo.es
done

