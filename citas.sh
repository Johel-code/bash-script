#!/bin/bash
# Autor: Johel Saavedra
# Script: Practica 6 ASO
# Fecha: Septiembre 2022

help(){
    echo "Usage: FILE... [OPTION]...
    Script para gestionar citas

    Interpretacion de opciones
        -h, --help      Mostrar texto de ayuda y salir
        -a, --add       Agregar una cita con HORA_INI, HORA_FIN, Y NOMBRE_PACIENTE
        -s, --search    Buscar los pacientes que contengan PATRON
        -i, --init      Buscar las citas que empiecen a HORA_INICIO
        -e, --end       Buscar las citas que terminen a HORA_FINAL
        -n, --name      Listar todas las citas ordenadas por NOMBRE_PACIENTE
        -o, --hour      Listar todas las citas ordenadas por HORA_INICIO"
}

help
