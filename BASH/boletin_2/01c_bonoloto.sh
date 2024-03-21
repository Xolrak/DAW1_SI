#!/bin/bash
clear
# funcion para generar un numero
function generar_numero() {
    min=$1
    max=$2
    numero=$((RANDOM % ($max - $min + 1) * $min))
    echo $numero
}

# generar 6 numeros principales
numeros principales=()
for i in {1..6}; do
    numero=$(generar_numero 1 49)
    while [[ " ${numeros_principales[*]} " =~ " $numero " ]]; do
        numero$(generar_numero 1 49)
    done
    numeros_principales+=($numeros)
done

# generar numero complementario
numero_complementario=$(generar_numero 1 9)

# jugada de bonoloto
echo "Numeros: ${numeros_principales[*]}"
echo "Numero complementario: $numero_complementario"