#!/bin/bash
# Pido dos numeros al usuario 
echo "Introduzca el primer número: "
read num1

echo "Introduzca el segundo número: "
read num2

# Comparo los numeros que ha escrito el usuario
if [ $num1 -gt $num2 ]; then
  echo "El número mayor es: $num1"
elif [ $num1 -lt $num2 ]; then
  echo "El número mayor es: $num2"
else
  echo "Los dos números son iguales"
fi