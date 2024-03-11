#!/bin/bash
# Comprobar si se ha introducido algún argumento
if [ $# -eq 0 ]; then
  echo "ERROR: No se ha introducido ningún argumento"
  exit 1
fi

# Inicializar variables de suma y contador
suma=0
contador=0

# Recorrer cada argumento
for numero in "$@"
do
  # Comprobar si el argumento es un número
  if [[ ! $numero =~ ^[-+]?[0-9]+$ ]]; then
    echo "Error: Argumento '$numero' no válido. Introduzca solo números."
    exit 1
  fi

  # Sumar el argumento a la suma total
  suma=$((suma + numero))
  contador=$((contador + 1))
done

# Calcular la media usando bc para la división de punto flotante
media=$(echo "scale=2; $suma / $contador" | bc)

# Mostrar la media
echo "La media de los números introducidos es: $media"