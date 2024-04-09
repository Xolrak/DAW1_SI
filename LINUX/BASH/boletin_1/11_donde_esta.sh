#!/bin/bash

# Este script busca un comando en el PATH y muestra su manual

# Reemplazar los puntos en el PATH por espacios
for i in `echo $PATH | tr "." " "`; do

  # Comprobar si el comando existe en el directorio actual
  if [ -x $i/$1 ]; then

    # Mostrar un mensaje indicando dónde se ha encontrado el comando
    echo "Localizado en $i"

    # Mostrar el manual del comando
    man -f $1

  fi

done
