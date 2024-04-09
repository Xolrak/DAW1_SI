#!/bin/bash

# Este script muestra el contenido de los archivos especificados como argumentos

for fich in "$*"; do

  # Mostrar un mensaje en blanco
  echo

  # Mostrar un mensaje indicando el nombre del archivo
  echo "Contenido del fichero $fich"

  # Mostrar el contenido del archivo
  cat $fich

  # Mostrar un mensaje en blanco
  echo

done
