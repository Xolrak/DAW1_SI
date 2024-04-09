#!/bin/bash

# Este script cuenta el número de veces que aparece cada palabra en un archivo, 
# ignorando las mayúsculas y minúsculas y ordenando el resultado por 
# frecuencia de aparición.

# Sustituir todas las nuevas líneas por un espacio
tr '\n' ' ' < texto.txt |

# Ordenar las palabras
sort |

# Contar el número de veces que aparece cada palabra, 
# ignorando las mayúsculas y minúsculas
uniq -c |

# Ordenar por frecuencia de aparición de mayor a menor
sort -nr
