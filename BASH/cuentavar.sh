#!/bin/bash
clear
echo "Numero de variables pasadas como parametros: $#"
echo "Estas son las variables: $*"
echo "Nombre del script: $0"
j=1
for i in $*
  do
    echo "parametro $j:$i"
    #j=$(($j + 1))
    ((j++))
  done
