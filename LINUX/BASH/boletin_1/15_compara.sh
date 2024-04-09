#!/bin/bash

# Este script compara dos números introducidos por el usuario y muestra el resultado de la comparación

# Pedir al usuario el primer número
echo -n "Introduce el primer número: "
read num1

# Pedir al usuario el segundo número
echo -n "Introduce el segundo número: "
read num2

# Comparar los números
if [ "$num1" -gt "$num2" ]; then
  # Si el primer número es mayor, mostrarlo
  echo "$num1 es mayor que $num2."
elif [ "$num1" -lt "$num2" ]; then
  # Si el segundo número es mayor, mostrarlo
  echo "$num1 es menor que $num2."
else
  # Si los números son iguales, mostrarlo
  echo "$num1 es igual a $num2."
fi
