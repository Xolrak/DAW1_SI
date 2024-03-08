# Función para mostrar mensajes
function Mensaje($tipo, $texto) {
    if ($tipo -eq "Error") {
        Write-Error "**ERROR:** $texto"
    } else {
        Write-Host "**$tipo:** $texto"
    }
}

# Variables
$rutaUsuarios = "C:\Users"
$rutaDAW1 = "X:\DAW1"
$rutaDestino = "F:\"
$rutaCompartida = "\\NombreServidor\NombreCompartido"
$rutaVMProfe = "\\VM-PROFE\COMPARTIR"

# 1. Copia de seguridad
try {
    wbadmin start backup -backupTarget $rutaDestino -include:$rutaUsuarios,$rutaDAW1 -quiet
    Mensaje "Exito" "Copia de seguridad realizada correctamente."
} catch {
    Mensaje "Error" $_.Exception.Message
}

# 2. Creación de la estructura
try {
    New-Item -ItemType Directory -Path "$rutaDAW1\SI"
    New-Item -Path "$rutaDAW1\SI\Act-ps1.txt" -Type File
    New-Item -ItemType Directory -Path "$rutaDAW1\BBDD"
    New-Item -ItemType Directory -Path "$rutaDAW1\FOL"
    Mensaje "Exito" "Estructura creada correctamente."
} catch {
    Mensaje "Error" $_.Exception.Message
}

# 3. Actualización de la copia de seguridad
try {
    wbadmin start backup -backupTarget $rutaDestino -include:$rutaDAW1 -quiet
    Mensaje "Exito" "Copia de seguridad actualizada correctamente."
} catch {
    Mensaje "Error" $_.Exception.Message
}

# 4. Eliminación y recuperación
try {
    Remove-Item -Path $rutaDAW1 -Recurse -Force
    wbadmin start recovery -backupTarget $rutaDestino -include:$rutaDAW1 -quiet
    Mensaje "Exito" "Recuperación realizada correctamente."
} catch {
    Mensaje "Error" $_.Exception.Message
}

# 5. Copia de seguridad en red
try {
    wbadmin start backup -backupTarget $rutaCompartida -include:X: -quiet
    Mensaje "Exito" "Copia de seguridad en red realizada correctamente."
} catch {
    Mensaje "Error" $_.Exception.Message
}

# 6. Creación del fichero
try {
    New-Item -Path "$rutaDAW1\SI\Act-ps2.txt" -Type File
    Mensaje "Exito" "Fichero creado correctamente."
} catch {
    Mensaje "Error" $_.Exception.Message
}

# 7. Actualización de la copia de seguridad en red
try {
    wbadmin start backup -backupTarget $rutaCompartida -include:X: -quiet
    Mensaje "Exito" "Copia de seguridad en red actualizada correctamente."
} catch {
    Mensaje "Error" $_.Exception.Message
}

# 8. Eliminación y recuperación
try {
    Remove-Item -Path $rutaDAW1 -Recurse -Force
    wbadmin start recovery -backupTarget $rutaCompartida -include:X: -quiet
    Mensaje "Exito" "Recuperación realizada correctamente."
} catch {
    Mensaje "Error" $_.Exception.Message
}

# 9. Copia de seguridad en VM-Profe
try {
    wbadmin start backup -backupTarget $rutaVMProfe -include:X: -quiet
    Mensaje "Exito" "Copia de seguridad en VM-Profe realizada correctamente."
} catch {
    Mensaje "Error" $_.Exception.Message
}

# 10. Creación del fichero
try {
    New-Item -Path "$rutaDAW1\SI\Act-ps3.txt" -Type File
    Mensaje "Exito" "Fichero creado correctamente."
} catch {
    Mensaje "Error" $_.Exception.Message
}

# 11. Actualización de la copia de seguridad en VM-Profe
try {
    wbadmin start backup -backupTarget $rutaVMProfe -include:X: -quiet
    Mensaje "Exito" "Copia de seguridad en VM-Profe actualizada correctamente."
} catch {
    Mensaje "Error" $_.Exception.Message
}

# 12. Eliminación y recuperación
# Eliminar la carpeta DAW1
try {
    Remove-Item -Path $rutaDAW1 -Recurse -Force
    Mensaje "Exito" "Carpeta DAW1 eliminada correctamente."
} catch {
    Mensaje "Error" $_.Exception.Message
}

# Recuperar la copia de seguridad desde VM-Profe
try {
    wbadmin start recovery -backupTarget $rutaVMProfe -include:X: -quiet
    Mensaje "Exito" "Recuperación desde VM-Profe realizada correctamente."
} catch {
    Mensaje "Error" $_.Exception.Message
}