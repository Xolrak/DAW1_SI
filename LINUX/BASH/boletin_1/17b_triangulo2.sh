#!/bin/bash

# validar que se ha introducido un argumento
if [ $# -ne 1 ]; then
  echo "ERROR: Debe introducir un numero como argumento"
  exit 1
fi

# obtener el numero de filas
n=$1

# bucle para recorrer las filas
for (( i=1; i<=n; i++ )); do

  # bucle para imprimir los asteriscos
  for (( j=1; j<=n-i; j++ )); do
    echo -n " "
  done
  # bucle para imprimir los espacios en blanco
  for (( k=1; k<=i; k++ )); do
    echo -n "* "
  done

  # salto de linea
  echo

done