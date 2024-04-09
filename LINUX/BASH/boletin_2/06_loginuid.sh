#!/bin/bash

# Este script crea un archivo "users.txt" que contiene los nombres de usuario 
# y sus UID (User Identifier) del archivo "/etc/passwd", ordenados por UID.

# 1. Obtener información de usuarios del sistema:
#   - "/etc/passwd": Archivo que contiene información de las cuentas de usuario.
#   - "cat": Muestra el contenido de un archivo en la terminal.
#   - "|": Tubería que envía la salida del comando anterior como entrada al siguiente.
#   - "cut -d':' -f1,3": 
#     - "-d:" Delimitador, separa campos por el caracter ":".
#     - "-f1,3": Selecciona los campos 1 (nombre de usuario) y 3 (UID) del archivo.
#   - "--output-delimiter=";": Especifica ";" como nuevo delimitador de campo.

cat /etc/passwd | cut -d':' -f1,3 --output-delimiter=";"  |

# 2. Ordenar por el segundo campo (UID):
#   - "sort -t';' -k2": 
#     - "-t';'": Delimitador, separa campos por ";".
#     - "-k2": Ordena por la segunda columna.
#   - "-n": Ordena numéricamente.

sort -t';' -k2 -n  |

# 3. Redireccionar la salida a un archivo:
#   - ">": Redirecciona la salida del comando anterior a un archivo.
#   "users.txt": Nombre del archivo que se creará.

> users.txt
