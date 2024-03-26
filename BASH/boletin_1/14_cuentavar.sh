#!/bin/bash

# Este script muestra información sobre las variables pasadas como parámetros

# Limpiar la pantalla
clear

# Mostrar el número de variables
echo "Número de variables pasadas como parámetros: $#"

# Mostrar todas las variables
echo "Estas son las variables: $*"

# Mostrar el nombre del script
echo "Nombre del script: $0"

# Recorrer las variables
j=1
for i in "$*"; do

  # Mostrar el índice y el valor de cada variable
  echo "Parámetro $j: $i"

  # Incrementar el índice
  ((j++))

done
