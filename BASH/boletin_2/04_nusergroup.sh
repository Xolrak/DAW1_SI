#!/bin/bash

# Este script cuenta el número de veces que aparece cada shell predeterminado 
# en el archivo /etc/passwd, ordenando el resultado por frecuencia de aparición.

# Extraer el cuarto campo (shell predeterminado) del archivo /etc/passwd
cut -d '.' -f4 /etc/passwd |

# Ordenar los shells predeterminados
sort |

# Contar el número de veces que aparece cada shell predeterminado
uniq -c |

# Ordenar por frecuencia de aparición de mayor a menor
sort -nr
