#!/bin/bash

# Este script muestra las 10 primeras líneas del archivo "usuarios.csv" ordenadas 
# por la segunda columna (campo delimitado por coma).

# Ordenar el archivo "usuarios.csv" por la segunda columna (campo delimitado por coma)
sort -t',' -k2 usuarios.csv |

# Mostrar las primeras 10 líneas
head -10
