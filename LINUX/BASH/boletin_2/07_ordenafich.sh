#!/bin/bash

# Este script ordena un archivo CSV por un campo especificado por el usuario.

# 1. Obtener nombre del archivo y campo a ordenar:

#   - "$1": Variable que contiene el primer argumento pasado al script.
#   - "head -n1 $archivo": Muestra la primera línea del archivo.
#   - "read -p": Solicita al usuario que introduzca un valor.

archiv=$1
head -n1 $archivo
read -p "Indica el nombre del campo por el que quieres ordenar: " campo

# 2. Generar nombre del archivo de salida:

#   - "${archivo%.*}": Elimina la extensión del archivo original.
#   - "_ord.txt": Sufijo para indicar que el archivo está ordenado.

archivo_salida=$(archivo%.*)_ord.txt

# 3. Obtener el número de la columna:

#   - "head -n 1 $archivo | tr ',' '\n'": Convierte la primera línea en un archivo con 
#     una línea por cada campo, utilizando "," como separador.
#   - "grep -n -x $campo": Busca el nombre del campo en el archivo temporal y 
#     muestra la línea donde se encuentra.
#   - "cut -d: -f1": Extrae el número de la columna del resultado de grep.

num_columna=`head -n 1 $archivo | tr ',' '\n' | grep -n -x $campo | cut -d: -f1`

# 4. Validar el campo:

#   - "[ -z $num_columna ]": Si la variable $num_columna está vacía...

if [ -z $num_columna ]
then
    echo "El campo $campo, no se encontro en $archivo"
    exit 1
fi

# 5. Generar archivo ordenado:

#   - "head -n 1 $archivo > $archivo_salida": Copia la primera línea del archivo 
#     original al archivo de salida.
#   - "sort -t',' -k$num_columna,n $archivo >> $archivo_salida": Ordena el archivo 
#     original por la columna indicada y añade el resultado al archivo de salida.

head -n 1 $archivo > $archivo_salida
sort -t',' -k$num_columna,n $archivo >> $archivo_salida

echo "El archivo $archivo_salida se ha creado con el contenido ordenado por $campo"

