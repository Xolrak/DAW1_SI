#!/bin/bash
# Lista de vehículos disponibles
vehiculos=("coche" "furgoneta" "bicicleta")

# Tabla de precios
precios=(20 10 5)

# Mostrar la lista de vehículos disponibles
echo "**Vehículos disponibles:**"
for (( i=0; i<${#vehiculos[@]}; i++ )); do
  echo -n "${vehiculos[$i]} "
done

echo

# Pedir al usuario que introduzca el vehículo que desea alquilar
echo "Introduzca el vehículo que desea alquilar: "
read vehiculo

# Buscar el índice del vehículo en la lista
indice=-1
for (( i=0; i<${#vehiculos[@]}; i++ )); do
  if [ "${vehiculos[$i]}" == "$vehiculo" ]; then
    indice=$i
    break
  fi
done

# Si el vehículo no está disponible, mostrar un mensaje de error
if [ $indice -eq -1 ]; then
  echo "El vehículo introducido no está disponible."
  exit 1
fi

# Obtener el precio del alquiler
precio=${precios[$indice]}

# Mostrar el precio del alquiler
echo "El precio del alquiler del $vehiculo es de $precio € por km."