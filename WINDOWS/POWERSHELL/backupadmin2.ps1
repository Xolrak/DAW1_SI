# Función para mostrar mensajes
function Mensaje($tipo, $texto) {
    if ($tipo -eq "Error") {
        Write-Error "**ERROR:** $texto"
    } else {
        Write-Host "**$tipo:** $texto"
    }
}

# Variables
$rutaDestino = "F:\BACKUP"
$rutaDocumento = "C:\ruta\al\documento.docx"
$horaPrimeraCopia = "10:00"
$horaSegundaCopia = "18:00"

# 1. Programar dos copias de seguridad
try {
    # Primera copia
    wbadmin start backup -backupTarget $rutaDestino -schedule "Diario" -startTime $horaPrimeraCopia -quiet
    Mensaje "Exito" "Primera copia de seguridad programada correctamente."

    # Segunda copia
    wbadmin start backup -backupTarget $rutaDestino -schedule "Diario" -startTime $horaSegundaCopia -quiet
    Mensaje "Exito" "Segunda copia de seguridad programada correctamente."
} catch {
    Mensaje "Error" $_.Exception.Message
}

# 2. Añadir un documento antes de la segunda copia
try {
    # Comprobar si la hora actual es la de la segunda copia
    if (Get-Date -Format "%H:%M" -eq $horaSegundaCopia) {
        # Copiar el documento
        Copy-Item -Path $rutaDocumento -Destination $rutaDestino -Force
        Mensaje "Exito" "Documento añadido correctamente a la copia de seguridad."
    }
} catch {
    Mensaje "Error" $_.Exception.Message
}

# 3. Eliminar y restaurar una versión
try {
    # Eliminar una versión específica
    wbadmin delete backup -backupTarget $rutaDestino -version <ID_de_la_version> -quiet
    Mensaje "Exito" "Versión de la copia de seguridad eliminada correctamente."

    # Restaurar una versión específica
    wbadmin start recovery -backupTarget $rutaDestino -version <ID_de_la_version> -quiet
    Mensaje "Exito" "Versión de la copia de seguridad restaurada correctamente."
} catch {
    Mensaje "Error" $_.Exception.Message
}

# 4. Deshabilitar la programación
try {
    wbadmin disable backup -backupTarget $rutaDestino -quiet
    Mensaje "Exito" "Programación de la copia de seguridad deshabilitada correctamente."
} catch {
    Mensaje "Error" $_.Exception.Message
}

# 5. Comprobar que no se ejecuta
try {
    Start-Sleep -Seconds 60
    if (Get-ScheduledTask -Name "Copia de seguridad diaria") {
        Mensaje "Error" "La copia de seguridad aún se ejecuta."
    } else {
        Mensaje "Exito" "La copia de seguridad no se ejecuta."
    }
} catch {
    Mensaje "Error" $_.Exception.Message
}

# 6. Volver a habilitar la programación
try {
    wbadmin enable backup -backupTarget $rutaDestino -quiet
    Mensaje "Exito" "Programación de la copia de seguridad habilitada correctamente."
} catch {
    Mensaje "Error" $_.Exception.Message
}

# 7. Eliminar copias anteriores
try {
    $fechaLimite = (Get-Date).AddDays(-7)
    Get-ChildItem -Path $rutaDestino -Filter *.vhd* -Recurse | Where-Object {$_.CreationTime -lt $fechaLimite} | Remove-Item -Force
    Mensaje "Exito" "Copias de seguridad anteriores eliminadas correctamente."
} catch {
    Mensaje "Error" $_.Exception.Message
}