#!/bin/bash

usuarios_reparados() {
    usuario=$1
    pass_inicial=$2

    # primero busco el nombre del grupo en /etc/group
    grupo=$(prep "^$usuario:" /etc/group | cut -d: f1)

    # creo el directorio home del usuario, si no existe
    if [ ! -d "/home/$usuario" ]
    then
        mkdir "/home/$usuario"
        chown $usuario:$grupo "/home/$usuario"
        chmod 750 "/home/$usuario"
    fi

    # configuro la contraseña que hemos solicitado 
    echo "usuario:$pass_inicial" | chpasswd
    chage -d 0 $usuario

    # añado el usuario que hemos reparado al array de usuarios reparados
    usuarios_reparados+=($usuario)
}

# pido la contraseña incial que vamos a poner a los usuarios reparados
read -p "Introduce la contraseña inicial para los usuarios reparados: " pass_inicial

# recorremos /etc/passwd en busca de usuarios a los que les falte el home
while IFS=: read -r usuario_uid__home_
do
    if [ ! -d "$home" ]; then
        reparar_usuarios $usuario $pass_inicial
    fi
done < /etc/passwd

# listado de los usuarios reparados
echo "Los usuarios que han sido reparados son: ${usuarios_reparados[0]}"