#!/bin/bash

# Este script genera una jugada aleatoria de la BonoLoto.

# Limpiar la pantalla
clear

# Función para generar un número aleatorio entre un mínimo y un máximo
function generar_numero() {
  min=$1
  max=$2
  numero=$((RANDOM % ($max - $min + 1) + $min))
  echo $numero
}

# Generar 6 números principales
numeros_principales=()
for i in {1..6}; do
  # Generar un número aleatorio
  numero=$(generar_numero 1 49)

  # Comprobar si el número generado ya está en el array
  while [[ " ${numeros_principales[*]} " =~ " $numero " ]]; do
    # Si está, generar otro número
    numero=$(generar_numero 1 49)
  done

  # Añadir el número al array
  numeros_principales+=($numero)
done

# Generar número complementario
numero_complementario=$(generar_numero 1 9)

# Mostrar la jugada de BonoLoto
echo "Números: ${numeros_principales[*]}"
echo "Número complementario: $numero_complementario"
