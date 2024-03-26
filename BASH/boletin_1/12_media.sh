#!/bin/bash

# Este script calcula la media de los números introducidos como argumentos

# Limpiar la pantalla
clear

# Inicializar variables
I=0  # Contador de números
MEDIA=0  # Suma acumulada de los números

# Recorrer los argumentos
for num in "$*"; do

  # Agregar el número a la suma acumulada
  let MEDIA+=$num

  # Incrementar el contador de números
  let I+=1

done

# Comprobar si se han introducido números (evitar división por cero)
if [ $I -eq 0 ]; then
  echo "No se han introducido números para calcular la media."
else
  # Calcular la media dividiendo la suma por el número de elementos
  let MEDIA=$MEDIA/$I

  # Mostrar el resultado
  echo "La media es $MEDIA"
fi
