#!/bin/bash

# Este script cuenta el número de veces que aparece cada palabra en un archivo.

# Limpiar la pantalla
clear

# Pedir al usuario el nombre del archivo
read -p "Dime el nombre del archivo: " archivo

# Comprobar si el archivo existe
if [ -f $archivo ]; then

  # Extraer las palabras del archivo
  palabras=$(grep -o -E "\w+" $archivo)

  # Ordenar las palabras
  palabras_ordenadas=$(sort <<< "$palabras")

  # Contar el número de veces que aparece cada palabra
  uniq -c <<< "$palabras_ordenadas"

else

  # Mostrar un mensaje de error
  echo "Archivo no encontrado"

fi
