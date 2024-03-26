#!/bin/bash
# Este script define un array asociativo para almacenar los precios por kilómetro de diferentes vehículos.

# Declarar el array asociativo
declare -A vehiculo
# Agregar los elementos al array
vehiculo[coche]="20€ x KM"
vehiculo[furgoneta]="10€ x KM"
vehiculo[bicicleta]="5€ x KM"