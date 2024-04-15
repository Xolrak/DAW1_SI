#!/bin/bash
clear
read -p "ruta del archivo: " ruta
read -p "Alumnos para premiar (1-30): " num
archivo=$ruta
if [[ $num -gt 30 || $num -lt 1 ]]; then
    echo "No hay esos alumnos"
else 
    cat $archivo | tail -n30 | sort -rt ";" -k6 | head -n$num | cut -d ";" f2,3,4 | tr ";" " " > FP_2024-2025.txt
    cat FP_2024-2025.txt | sort -k2 -k3