#!/bin/bash

# Función para comprobar si se ejecuta con privilegios de superusuario
check_root() {
    if [ "$(id -u)" -ne 0 ]; then
        echo "Este script debe ejecutarse como root."
        exit 1
    fi
}

# Función para solicitar y verificar la contraseña inicial
solicitar_contrasena() {
    read -sp "Introduce la contraseña inicial para los usuarios: " PASSWORD
    echo
    if [ -z "$PASSWORD" ]; then
        echo "La contraseña no puede estar vacía."
        exit 1
    fi
}

# Función para crear el directorio de trabajo del usuario, establecer permisos y configurar la contraseña
reparar_usuario() {
    local USERNAME=$1
    local HOMEDIR=$2
    local USERID=$3
    local GROUPID=$4

    # Crear el directorio de trabajo si no existe
    if [ ! -d "$HOMEDIR" ]; then
        mkdir -p "$HOMEDIR"
        echo "Directorio $HOMEDIR creado para el usuario $USERNAME."
    fi

    # Establecer el propietario y el grupo del directorio
    chown $USERID:$GROUPID "$HOMEDIR"
    chmod 700 "$HOMEDIR"
    echo "Propietario y permisos establecidos para $HOMEDIR."

    # Establecer la contraseña y forzar el cambio en el primer inicio de sesión
    echo "$USERNAME:$PASSWORD" | chpasswd
    chage -d 0 "$USERNAME"
    echo "Contraseña establecida y cambio de contraseña forzado para el usuario $USERNAME."
}

# Comprobar si el script se ejecuta con privilegios de superusuario
check_root

# Solicitar la contraseña inicial
solicitar_contrasena

# Array para guardar los logins de los usuarios reparados
declare -a usuarios_reparados

# Leer el archivo /etc/passwd para obtener los usuarios
while IFS=: read -r USERNAME PASSWORD USERID GROUPID GECOS HOMEDIR SHELL; do
    # Comprobar si el UID está en el rango de usuarios normales (por ejemplo, >= 1000)
    if [ "$USERID" -ge 1000 ] && [ -z "$PASSWORD" ]; then
        # Reparar el usuario
        reparar_usuario "$USERNAME" "$HOMEDIR" "$USERID" "$GROUPID"
        # Añadir el usuario al array de usuarios reparados
        usuarios_reparados+=("$USERNAME")
    fi
done < /etc/passwd

# Mostrar el resultado final
if [ ${#usuarios_reparados[@]} -gt 0 ]; then
    echo "Usuarios reparados:"
    for usuario in "${usuarios_reparados[@]}"; do
        echo "$usuario"
    done
else
    echo "No se han reparado usuarios."
fi
