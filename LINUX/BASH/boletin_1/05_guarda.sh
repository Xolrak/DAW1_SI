#!/bin/bash

# Este script copia el directorio actual al directorio "Seguridad" del usuario

# Pedir al usuario el nombre de usuario
read -p "Usuario: " usuario

# Pedir al usuario el nombre del directorio
read -p "Directorio: " dir

# Comprobar si el directorio "Seguridad" del usuario existe
if [ -d "/home/$usuario/$dir/Seguridad" ]; then

  # Si el directorio existe, mostrar un mensaje de aviso
  echo "El directorio ya existe"

else

  # Si el directorio no existe, copiarlo al directorio "Seguridad" del usuario
  cp -r . /home/$usuario/$dir/Seguridad

fi
