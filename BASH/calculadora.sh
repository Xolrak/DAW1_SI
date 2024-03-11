#!/bin/bash

# Bucle principal del programa
while true; do
  echo "**Calculadora Básica**"
  echo "---------------------"
  echo "1. Suma"
  echo "2. Resta"
  echo "3. Multiplicación"
  echo "4. División"
  echo "5. Salir"
  echo "---------------------"
  echo -n "Elige una opción: "

  read opcion

  case $opcion in
    1)
      echo -n "Introduce el primer número: "
      read num1
      echo -n "Introduce el segundo número: "
      read num2
      resultado=$((num1 + num2))
      echo "La suma de $num1 y $num2 es: $resultado"
      echo ""
      ;;
    2)
      echo -n "Introduce el primer número: "
      read num1
      echo -n "Introduce el segundo número: "
      read num2
      resultado=$((num1 - num2))
      echo "La resta de $num1 y $num2 es: $resultado"
      echo ""
      ;;
    3)
      echo -n "Introduce el primer número: "
      read num1
      echo -n "Introduce el segundo número: "
      read num2
      resultado=$((num1 * num2))
      echo "La multiplicación de $num1 y $num2 es: $resultado"
      echo ""
      ;;
    4)
      echo -n "Introduce el primer número: "
      read num1
      echo -n "Introduce el segundo número: "
      read num2
      if [ "$num2" -eq 0 ]; then
        echo "Error: No se puede dividir por 0."
        echo ""
      else
        resultado=$((num1 / num2))
        echo "La división de $num1 y $num2 es: $resultado"
        echo ""
      fi
      ;;
    5) exit 0;;
    *) echo "Opción no válida.";;
  esac
done
