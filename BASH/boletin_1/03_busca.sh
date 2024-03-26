#!/bin/bash
# Limpia la pantalla
clear
# Muestra un salto de línea
echo
# Lee el nombre del usuario a buscar del usuario
read -p "Introduce el nombre del usuario a buscar: " NOMBRE
# Busca el nombre del usuario en el archivo /etc/passwd
EXISTE=`grep $NOMBRE /etc/passwd`
# Muestra un salto de línea
echo
# Si la variable EXISTE está vacía, significa que el usuario no existe
if [ -z "$EXISTE" ]
then
  # Muestra un mensaje indicando que el usuario no existe
  echo "$NOMBRE no tiene un usuario creado en el sistema"
else
  # Muestra un mensaje indicando que el usuario existe
  echo "$NOMBRE tiene un usuario creado en el sistema"
fi
# **Explicación de los comandos:**
# clear: Este comando borra la pantalla.
# echo: Este comando muestra un mensaje en la pantalla.
# read: Este comando lee una línea de texto del usuario.
# grep: Este comando busca una cadena de texto en un archivo.
# if: Esta instrucción condicional se usa para ejecutar un bloque de código si se cumple una condición.
# then: Esta palabra clave se usa para indicar el inicio del bloque de código que se ejecutará si se cumple la condición.
# else: Esta palabra clave se usa para indicar el inicio del bloque de código que se ejecutará si no se cumple la condición.
# fi: Esta palabra clave se usa para indicar el final de la instrucción condicional.
