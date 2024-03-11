#!/bin/bash

# Imprimir las variables
for var in "$@"; do
  echo "Variable: $var"
done

# Contar las variables
num_vars=$#

# Imprimir el número de variables
echo "Número de variables: $num_vars"