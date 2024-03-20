echo "hola mundo"
#!/bin/bash

clear
echo
read -p "Introduce el nombre del usuario a buscar: " NOMBRE
EXISTE=`grep $NOMBRE /etc/passwd
echo
if [ -z "$EXISTE" ]
then
    echo "$NOMBRE no tiene un usuario creado en el sistema"
else
    echo $NOMBRE tiene un usuario creado en el sistema"
echo