#!/bin/bash
# Pedir al usuario dos numeros
echo -n "Introduce el primer número: "
read num1
echo -n "Introduce el segundo número: "
read num2

# Comparo los numeros
if [ "$num1" -gt "$num2" ]; then
  echo "$num1 es mayor que $num2."
elif [ "$num1" -lt "$num2" ]; then
  echo "$num1 es menor que $num2."
else
  echo "$num1 es igual a $num2."
fi
