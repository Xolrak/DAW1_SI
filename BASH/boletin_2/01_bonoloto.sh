#!/bin/bash
clear
# Array para almacenar los números
numeros=( $(seq 1 49) )

# Generar 6 números aleatorios
for (( i=0; i<6; i++ )); do
  # Obtener un índice aleatorio
  indice=$((RANDOM % ${#numeros[@]}))

  # Guardar el número en la posición $i del array "jugada"
  jugada[$i]=${numeros[$indice]}

  # Eliminar el número del array "numeros" para evitar duplicados
  unset numeros[$indice]

  # Reducir el tamaño del array "numeros"
  numeros=( "${numeros[@]:0:$((indice-1))}" "${numeros[@]:$((indice+1))}" )
done

# Ordenar la jugada
jugada=( $(sort -n <<< "${jugada[*]}") )

# Mostrar la jugada
echo "Tu jugada aleatoria de la BonoLoto es:"
echo "${jugada[*]}"