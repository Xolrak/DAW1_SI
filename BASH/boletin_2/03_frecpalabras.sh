#!/bin/bash
clear
read p "dime el nombre del archivo: " archivo
if [ -f $archivo ]
then
    grep -o -E "\w+" $archivo | sort | uniq -c
else
    echo archivo no encontrado
fi