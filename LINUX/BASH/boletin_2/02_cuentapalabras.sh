#!/bin/bash

# Este script cuenta el número de palabras en un archivo.

# Limpiar la pantalla
clear

# Pedir al usuario el nombre del archivo
read -p "Introduce el nombre del archivo: " archivo

# Comprobar si el archivo existe
if [ -f $archivo ]; then

  # Contar el número de palabras en el archivo
  palabras=$(wc -w < $archivo)

  # Mostrar el resultado
  echo "El archivo $archivo tiene $palabras palabras"

else

  # Mostrar un mensaje de error
  echo "El archivo no existe"

fi
