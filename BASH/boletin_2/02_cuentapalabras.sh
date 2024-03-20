#!/bin/bash
clear
read -p "Introduce el nombre del archivo: " archivo
if [ -f $archivo ]; then
    palabras=$(wc -w < $archivo)
    echo "El archivo $archivo tiene $palabras palabras"
else
    echo "El archivo no existe"
fi