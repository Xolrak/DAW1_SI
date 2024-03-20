#!/bin/bash

# Validar que se ha introducido un argumento
if [ $# -ne 1 ]; then
  echo "Error: Debe introducir un número como argumento."
  exit 1
fi

# Obtener el número de filas
n=$1

# Bucle para recorrer las filas
for (( i=1; i<=n; i++ )); do

  # Bucle para imprimir los espacios en blanco
  for (( j=1; j<=n-i; j++ )); do
    echo -n " "
  done

  # Bucle para imprimir los asteriscos
  for (( k=1; k<=2*i-1; k++ )); do
    echo -n "*"
  done

  # Salto de línea
  echo

done