#!/bin/bash
while true; do
  echo "**Calculadora Basica**"
  echo "---------------------"
  echo "1. Suma"
  echo "2. Resta"
  echo "3. Multiplicacion"
  echo "4. Division"
  echo "5. Salir"
  echo "---------------------"
  echo -n "Elige una opcion: "
  read opcion
  case $opcion in
    1)
      echo -n "Introduce el primer numero: "
      read num1
      echo -n "Introduce el segundo numero: "
      read num2
      resultado=$((num1 + num2))
      clear
      echo "La suma de $num1 y $num2 es: $resultado"
      echo ""
      ;;
    2)
      echo -n "Introduce el primer numero: "
      read num1
      echo -n "Introduce el segundo numero: "
      read num2
      resultado=$((num1 - num2))
      clear
      echo "La resta de $num1 y $num2 es: $resultado"
      echo ""
      ;;
    3)
      echo -n "Introduce el primer numero: "
      read num1
      echo -n "Introduce el segundo numero: "
      read num2
      resultado=$((num1 * num2))
      clear
      echo "La multiplicacion de $num1 y $num2 es: $resultado"
      echo ""
      ;;
    4)
      echo -n "Introduce el primer numero: "
      read num1
      echo -n "Introduce el segundo numero: "
      read num2
      resultado=$((num1 / num2))
      clear
      echo "La division de $num1 y $num2 es: $resultado"
      echo ""
      fi
      ;;
    5) exit 0;;
    *) 
    clear 
    echo "Opcion no valida.";;
  esac
done