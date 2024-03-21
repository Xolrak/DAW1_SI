#!/bin/bash
archiv=$1
head -n1 $archivo
read -p "Indica el nombre del campo por el que quieres ordenar: " campo

archivo_salida=$(archivo%.*)_ord.txt
num_columna=`head -n 1 $archivo | tr ',' '\n' | grep -n -x $campo | cut -d: -f1`
echo "El campo $campo se ha encontrado en la columna $num_columna"

if [ -z $num_columna ]
then
    echo "El campo $campo, no se encontro en $archivo"
    exit 1
fi
head -n 1 $archivo > $archivo_salida
