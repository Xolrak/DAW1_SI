#!/bin/bash

# **Definir la lista de nombres**
nombres=( "Ana" "Juan" "María" "Pedro" "Laura" "David" )

# **Mostrar la lista original**
echo "Lista original:"
echo "${nombres[@]}"

# **Ordenar la lista alfabéticamente**
sort -u "${nombres[@]}"

# **Mostrar la lista ordenada**
echo "Lista ordenada:"
echo "${nombres[@]}"

man cut