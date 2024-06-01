#!/bin/bash

# Archivo principal de la pirámide
FILE="piramide.txt"

# Función para comprobar si se ejecuta con privilegios de superusuario
check_root() {
    if [ "$(id -u)" -ne 0 ]; then
        echo "Este script debe ejecutarse como root."
        exit 1
    fi
}

# Función para dibujar la pirámide invertida
dibujar_piramide() {
    read -p "Introduce la altura de la pirámide: " altura
    if ! [[ "$altura" =~ ^[0-9]+$ ]]; then
        echo "Por favor, introduce un número válido."
        return
    fi

    # Limpiar el archivo anterior
    > $FILE

    # Generar la pirámide invertida
    for ((i = altura; i > 0; i--)); do
        for ((j = 0; j < altura - i; j++)); do
            echo -n " " >> $FILE
        done
        for ((k = 0; k < 2 * i - 1; k++)); do
            echo -n "*" >> $FILE
        done
        echo >> $FILE
    done

    # Crear copias del archivo
    cp $FILE ${FILE}_cop1.txt
    cp $FILE ${FILE}_cop2.txt
    cp $FILE ${FILE}_cop3.txt
    echo "Pirámide dibujada en $FILE y copias creadas."
}

# Función para mostrar el contenido de piramide.txt
mostrar_piramide() {
    if [ -f "$FILE" ]; then
        cat $FILE
    else
        echo "El archivo $FILE no existe."
    fi
}

# Función para contar el número de asteriscos en piramide.txt
contar_asteriscos() {
    if [ -f "$FILE" ]; then
        local count=$(grep -o "\*" $FILE | wc -l)
        echo "El archivo $FILE contiene $count asteriscos."
    else
        echo "El archivo $FILE no existe."
    fi
}

# Función para sustituir "*" por otro carácter
sustituir_asteriscos() {
    read -p "Introduce el carácter por el que deseas sustituir '*': " char
    if [ -z "$char" ]; then
        echo "El carácter no puede estar vacío."
        return
    fi

    if [ -f "$FILE" ]; then
        tr '*' "$char" < $FILE > temp_piramide.txt && mv temp_piramide.txt $FILE
        echo "Los asteriscos han sido sustituidos por '$char' en $FILE."
    else
        echo "El archivo $FILE no existe."
    fi
}

# Función para rotar la pirámide 180 grados
rotar_piramide() {
    if [ -f "$FILE" ]; then
        tac $FILE > temp_piramide.txt && mv temp_piramide.txt $FILE
        echo "La pirámide ha sido rotada 180 grados en $FILE."
    else
        echo "El archivo $FILE no existe."
    fi
}

# Función para mostrar el menú y manejar las opciones del usuario
menu() {
    PS3="Seleccione una opción: "
    options=("Dibujar pirámide" "Mostrar pirámide" "Contar asteriscos" "Sustituir asteriscos" "Rotar pirámide" "Salir")
    select opt in "${options[@]}"; do
        case $opt in
            "Dibujar pirámide")
                dibujar_piramide
                ;;
            "Mostrar pirámide")
                mostrar_piramide
                ;;
            "Contar asteriscos")
                contar_asteriscos
                ;;
            "Sustituir asteriscos")
                sustituir_asteriscos
                ;;
            "Rotar pirámide")
                rotar_piramide
                ;;
            "Salir")
                echo "Saliendo del script."
                break
                ;;
            *)
                echo "Opción inválida $REPLY"
                ;;
        esac
    done
}

# Comprobar si el script se ejecuta con privilegios de superusuario
check_root

# Mostrar el menú
menu
