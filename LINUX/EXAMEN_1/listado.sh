#!/bin/bash

# Solicita el año académico
read -p "Introduce el año académico (ejemplo: 2023-2024): " ANO

# Nombre del archivo de salida basado en el año académico introducido
OUTPUT_FILE="premiadosFP_${ANO}.txt"

# Comprueba si el archivo alumnos.csv existe
if [ ! -f "alumnos.csv" ]; then
    echo "El archivo alumnos.csv no existe."
    exit 1
fi

# Cuenta el número total de alumnos en el archivo
TOTAL_ALUMNOS=$(wc -l < alumnos.csv)
# Restar 1 para excluir la línea del encabezado
TOTAL_ALUMNOS=$((TOTAL_ALUMNOS - 1))

# Solicita el número de alumnos a premiar
read -p "Introduce el número de alumnos a premiar: " NUM_PREMIADOS

# Comprueba que el número de premiados no sea mayor que el número total de alumnos
if [ "$NUM_PREMIADOS" -gt "$TOTAL_ALUMNOS" ]; then
    echo "El número de alumnos a premiar no puede ser mayor que el número total de alumnos ($TOTAL_ALUMNOS)."
    exit 1
fi

# Crear el archivo de salida vacío
> $OUTPUT_FILE

# Procesar el archivo alumnos.csv:
# 1. Saltar la primera línea (encabezado)
# 2. Ordenar por nota en orden descendente
# 3. Tomar los primeros N alumnos especificados por NUM_PREMIADOS
# 4. Ordenar alfabéticamente por apellido y nombre
# 5. Extraer los campos necesarios (apellido, nombre, ciclo)
tail -n +2 alumnos.csv | \
sort -t, -k6,6nr | \
head -n $NUM_PREMIADOS | \
sort -t, -k3,3 -k2,2 | \
awk -F, '{print $3, $2, $4}' > $OUTPUT_FILE

echo "El listado de premiados ha sido generado en $OUTPUT_FILE"
