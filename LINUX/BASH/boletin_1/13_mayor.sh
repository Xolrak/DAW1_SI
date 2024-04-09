#!/bin/bash

# Este script compara dos números introducidos por el usuario y muestra el mayor

# Pedir el primer número al usuario
echo "Introduzca el primer número: "
read num1

# Pedir el segundo número al usuario
echo "Introduzca el segundo número: "
read num2

# Comparar los números
if [ $num1 -gt $num2 ]; then
  # Si el primer número es mayor, mostrarlo
  echo "El número mayor es: $num1"
elif [ $num1 -lt $num2 ]; then
  # Si el segundo número es mayor, mostrarlo
  echo "El número mayor es: $num2"
else
  # Si los números son iguales, mostrarlo
  echo "Los dos números son iguales"
fi
