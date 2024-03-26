#!/bin/bash

# Este script rota los ficheros de log que superan un límite de líneas.

# Directorio donde se encuentran los ficheros de log
directorio_logs=$PWD

# Directorio donde se guardarán los ficheros rotados
directorio_old_rot="old_rot"

# Número máximo de líneas por fichero
max_lineas=50

# Número máximo de ficheros rotados
max_ficheros_rotados=4

# Obtener la lista de ficheros *.log
ficheros_log=$(find . -name "*.log" -type f)

# Recorrer la lista de ficheros
for fichero in $ficheros_log; do

  # Obtener el número de líneas del fichero
  numero_lineas=$(wc -l < $fichero)

  # Si el número de líneas es mayor que el máximo
  if [ $numero_lineas -gt $max_lineas ]; then

    # Mostrar un mensaje informativo
    echo "**Fichero $fichero supera el límite de líneas ($max_lineas). Se procederá a rotarlo.**"

    # Obtener las últimas 30 líneas del fichero
    ultimas_lineas=$(tail -n 30 $fichero)

    # Eliminar las líneas sobrantes del fichero original
    sed -i '1,30d' $fichero

    # Generar el nombre del fichero comprimido
    nombre_comprimido="$fichero.rot$(date +%Y%m%d)"

    # Si el número de ficheros rotados es mayor que el máximo
    if [ $(ls -1 $directorio_old_rot | wc -l) -gt $max_ficheros_rotados ]; then

      # Eliminar el fichero rotado más antiguo
      rm -f $directorio_old_rot/$(ls -1 $directorio_old_rot | sort -n | head -n 1)

    fi

    # Comprimir las últimas líneas eliminadas
    gzip -c "$ultimas_lineas" > "$directorio_old_rot/$nombre_comprimido.gz"

  fi

done