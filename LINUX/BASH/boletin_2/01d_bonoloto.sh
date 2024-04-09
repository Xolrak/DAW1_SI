#!/bin/bash

# Este script genera una jugada aleatoria de la BonoLoto.

# Limpiar la pantalla
clear

# Array para almacenar los números de la jugada
bonoloto=()

# Generar 6 números aleatorios sin repetir
for i in {1..6}; do

  # Variable para controlar si el número ya existe
  existe=1

  # Bucle para generar un número aleatorio hasta que no exista en el array
  while [ $existe -eq 1 ]; do

    # Generar un número aleatorio entre 1 y 49
    num=$((RANDOM % 49 + 1))

    # Variable para controlar si el número ya existe en el array
    existe=0

    # Recorrer el array para comprobar si el número ya existe
    for val in "${bonoloto[@]}"; do

      # Si el número ya existe, salir del bucle interno
      if [ $val -eq $num ]; then
        existe=1
        #echo "El número $num ya existía"
        break
      fi

    done

  done

  # Añadir el número al array
  bonoloto+=($num)

done

# Ordenar el array
bonoloto_ordenada=($(for i in "${bonoloto[@]}"; do echo $i; done | sort -n))

# Mostrar la jugada de la BonoLoto
echo "Tu jugada de la BonoLoto es: ${bonoloto_ordenada[@]}"
