#!/bin/bash
clear
DATA=`date +%y-%m-%d`
echo
read -p "Introduce con PATH absoluto el directorio donde estan los ficheros a guardar: " DIRORI
read -p "Introduce con PATH absoluto el directorio donde quieres guardarlos: " DIRDEST
read -p "Se va a comprimir en un tar loos ficheros, undica el nombre del tar" NOM
if [ ! -d $DIRDEST ]
then
    if [ ! -d $DIRDEST]
    then
        echo "no existia el directorio destino, se va a crear"
        mkdir $DIRDEST
    fi
    tar cvf $DIRDEST/$NOM-$DATA.tar $DIRORI
    echo "se han guardado los ficheros"
else
    echo "ATENCION: no se ha podido realizar la operacion porque el directorio origen no existe"
fi
echo