#!/bin/bash
# Opciones del menú
opcion1="Guardar archivos"
opcion2="Salir"

# Mostrar el menú
echo "Menu:"
echo "1) $opcion1"
echo "2) $opcion2"

# Leer la opción del usuario
read -p "Selecciona una opcion (1-2): " ELECCION

case "$ELECCION" in
    1)
        DATA=$(date +%y-%m-%d)
        read -p "Introduce la ruta absoluta del directorio donde estan los archivos a guardar: " DIRORI

        read -p "Introduce la ruta absoluta del directorio donde desdeas guardar los archivos: " DIRDEST

        read -p "Indica el nombre del archivo tar: " NOM

        if [ -d "$DIRORI" ]; then
            if [ ! -d "DIRDEST" ]; then
                echo "El directorio de destino no existía. Creando repositorio..."
                mkdir -p "$DIRDEST"
            fi