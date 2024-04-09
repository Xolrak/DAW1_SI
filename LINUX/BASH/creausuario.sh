#!/bin/bash

# funciones
function crearusuario() {
  # se comprueba que el grupo exista, si no se crea
  if grep -q "$3" /etc/group; then
    # se crea el usuario añadiendolo al grupo
    useradd -mg "$3" "$1"
    # se crea la contraseña a partir del parametro
    echo -e "$1:$2" | chpasswd
  else
    # no existe, se crea
    addgroup "$3"
    useradd -mg "$3" "$1"
    echo -e "$1:$2" | chpasswd
  fi

  # se activa la cuenta del usuario si se ha especificado
  if [ "$4" == "1" ]; then
    usermod -U "$1"
  fi
}

# script
clear

if [[ $EUID -ne 0 ]]; then
  echo -e "El usuario no es root, no se le permite ejecutar el script"
  exit 1
fi

echo -e "Introduce la ubicación del fichero"

# bucle de admision de input
A=0
while [ $A -eq 0 ]; do
  read fichero

  # se comprueba que el fichero existe y no está vacio
  if [[ -s $fichero ]]; then
    A=1
  else
    echo "ERROR: el fichero no existe o esta vacio"
    echo "Introduzca de nuevo el nombre y ruta del fichero"
  fi
done

# lectura del fichero linea a linea y asignacion de variables
while read -a line; do

  # saltamos el encabezado
  encabezado=$(echo "${line[0]}" | grep "#")
  if [ -z $encabezado ]; then

    nombre="${line[0]}"
    pas="${line[1]}"
    group="${line[2]}"
    act="${line[3]}"

    # se crea el usuario
    crearusuario "$nombre" "$pas" "$group" "$act"

  fi

done

echo -e "**Proceso finalizado**"