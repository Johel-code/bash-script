#!/bin/bash
# Autor: Johel Saavedra
# Script practica4 ASO
# Fecha: Septiembre 2022

#users=($(cat /etc/passwd | grep al-03-04 | cut -d":" -f1))

for user in `cat /etc/passwd |grep al-03-04 | cut -f1 -d":"`
do
    var=$(finger $user | grep Never)

    if [ "$var" == "Never logged in." ]
    then
        echo "$user. Usuario inactivo, se borra su cuenta"
#        sudo deluser "$(user)"
    else
        mkdir "/var/tmp/${user}"        
        cd "/var/tmp/${user}"
#        wget -m "http://localhost/${user}"
        echo "Usuario activo, copiando su web en /var/tmp/${user}"
    fi
done

