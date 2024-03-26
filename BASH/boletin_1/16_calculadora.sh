#!/bin/bash

# Este script es una calculadora básica que permite realizar operaciones de suma, resta, multiplicación y división.

# Bucle principal
while true; do

  # Mostrar el menú de opciones
  clear
  echo "**Calculadora Básica**"
  echo "---------------------"
  echo "1. Suma"
  echo "2. Resta"
  echo "3. Multiplicación"
  echo "4. División"
  echo "5. Salir"
  echo "---------------------"

  # Pedir al usuario la opción deseada
  echo -n "Elige una opción: "
  read opcion

  # Evaluar la opción seleccionada
  case $opcion in
    1)
      # Suma
      echo -n "Introduce el primer número: "
      read num1
      echo -n "Introduce el segundo número: "
      read num2
      resultado=$((num1 + num2))
      clear
      echo "La suma de $num1 y $num2 es: $resultado"
      echo ""
      ;;
    2)
      # Resta
      echo -n "Introduce el primer número: "
      read num1
      echo -n "Introduce el segundo número: "
      read num2
      resultado=$((num1 - num2))
      clear
      echo "La resta de $num1 y $num2 es: $resultado"
      echo ""
      ;;
    3)
      # Multiplicación
      echo -n "Introduce el primer número: "
      read num1
      echo -n "Introduce el segundo número: "
      read num2
      resultado=$((num1 * num2))
      clear
      echo "La multiplicación de $num1 y $num2 es: $resultado"
      echo ""
      ;;
    4)
      # División
      echo -n "Introduce el primer número: "
      read num1
      echo -n "Introduce el segundo número: "
      read num2
      resultado=$((num1 / num2))
      clear
      echo "La división de $num1 y $num2 es: $resultado"
      echo ""
      ;;
    5)
      # Salir
      exit 0
      ;;
    *)
      # Opción no válida
      clear
      echo "Opción no válida."
      ;;
  esac

done
