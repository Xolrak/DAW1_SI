#!/bin/bash

# Este script muestra información del sistema y del usuario

# Definición de variables
# La variable "fecha" almacena la fecha actual en formato "dd de mmm de yyyy"
fecha=$(date +"%d de %b de %Y")

# La variable "usuario" almacena el nombre del usuario actual
usuario=$(whoami)

# La variable "directorio" almacena el directorio actual
directorio=$(pwd)

# Salida por pantalla
# Se muestra la fecha actual
echo "La fecha de hoy es: $fecha"

# Se muestra el nombre del usuario actual
echo "Soy el usuario: $usuario"

# Se muestra el directorio actual
echo "Me encuentro en el directorio: $directorio"
