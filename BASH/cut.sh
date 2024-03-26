#!/bin/bash

# **Definir la variable que contiene la línea de texto**
linea="Nombre: Juan Pérez, Edad: 30, Ciudad: Madrid"

# **Extraer el nombre utilizando `cut`**
# -d',' indica que el separador de campos es una coma
# -f1 indica que se desea el primer campo
nombre=$(cut -d',' -f1 <<< "$linea")

# **Mostrar el nombre con un comentario**
echo "Nombre: $nombre" # Se ha extraído el nombre

# **Extraer la edad utilizando `cut`**
# -f2 indica que se desea el segundo campo
edad=$(cut -d',' -f2 <<< "$linea")

# **Mostrar la edad con un comentario**
echo "Edad: $edad" # Se ha extraído la edad

# **Extraer la ciudad utilizando `cut`**
# -f3 indica que se desea el tercer campo
ciudad=$(cut -d',' -f3 <<< "$linea")

# **Mostrar la ciudad con un comentario**
echo "Ciudad: $ciudad" # Se ha extraído la ciudad
