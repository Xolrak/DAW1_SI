#!/bin/bash
clear
# Función para generar un número aleatorio entre 1 y 49
generate_random_number() {
    echo $((1 + RANDOM % 49))
}

# Array para almacenar los números generados
numbers=()

# Generar seis números diferentes
while [ ${#numbers[@]} -lt 6 ]; do
    # Generar un número aleatorio
    random_number=$(generate_random_number)

    # Comprobar si el número generado ya está en el array
    if ! [[ " ${numbers[@]} " =~ " $random_number " ]]; then
        # Si no está, añadirlo al array
        numbers+=($random_number)
    fi
done

# Ordenar los números
IFS=$'\n' sorted_numbers=($(sort -n <<<"${numbers[*]}"))

# Mostrar los números ordenados
echo "Jugada de la Bonoloto:"
for number in "${sorted_numbers[@]}"; do
    echo $number
done
