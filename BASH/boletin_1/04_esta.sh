#!/bin/bash

# Este script comprime un directorio en un archivo tar

# Limpiar la pantalla
clear

# Obtener la fecha actual en formato "yy-mm-dd"
DATA=`date +%y-%m-%d`

# Mostrar un mensaje en blanco
echo

# Pedir al usuario el directorio donde están los archivos a guardar
read -p "Introduce con PATH absoluto el directorio donde estan los ficheros a guardar: " DIRORI

# Pedir al usuario el directorio donde quiere guardarlos
read -p "Introduce con PATH absoluto el directorio donde quieres guardarlos: " DIRDEST

# Pedir al usuario el nombre del archivo tar
read -p "Se va a comprimir en un tar loos ficheros, undica el nombre del tar" NOM

# Comprobar si el directorio destino no existe
if [ ! -d $DIRDEST ]; then

  # Si no existe, crearlo
  if [ ! -d $DIRDEST ]; then
    echo "No existia el directorio destino, se va a crear"
    mkdir $DIRDEST
  fi

  # Comprimir los archivos en un archivo tar
  tar cvf $DIRDEST/$NOM-$DATA.tar $DIRORI

  # Mostrar un mensaje indicando que se han guardado los archivos
  echo "Se han guardado los ficheros"

else

  # Mostrar un mensaje de error indicando que el directorio origen no existe
  echo "ATENCION: no se ha podido realizar la operacion porque el directorio origen no existe"

fi

# Mostrar un mensaje en blanco
echo
