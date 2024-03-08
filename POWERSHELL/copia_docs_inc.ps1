# Obtener la fecha actual
$fecha = Get-Date -Format "yyyy-MM-dd"

# Ruta de la carpeta "Documentos"
$rutaDocumentos = Get-FolderPath "Documents"

# Ruta de la carpeta de destino
$rutaDestino = "F:\BACKUP\"

# Crear la carpeta de destino si no existe
if (-not (Test-Path $rutaDestino)) {
    New-Item -ItemType Directory -Path $rutaDestino
}

# Nombre del archivo comprimido
$nombreArchivo = "$fecha-docs_inc.zip"

# Obtener la última copia de seguridad incremental
$ultimaCopia = Get-ChildItem -Path $rutaDestino -Filter *.zip | Sort-Object -Property LastWriteTime -Descending | Select-Object -First 1

# Si no hay una última copia, realizar una copia de seguridad completa
if ($ultimaCopia -eq $null) {
    Compress-Archive -Path $rutaDocumentos -DestinationPath "$rutaDestino\$nombreArchivo" -Force
} else {
    # Obtener la fecha de la última copia de seguridad
    $fechaUltimaCopia = $ultimaCopia.LastWriteTime.ToString("yyyy-MM-dd")

    # Filtrar archivos modificados desde la última copia
    $archivosModificados = Get-ChildItem -Path $rutaDocumentos -Filter *.doc,*.docx,*.pdf,*.xlsx -Recurse -Include *.txt | Where-Object { $_.LastWriteTime -gt $fechaUltimaCopia }

    # Si hay archivos modificados, realizar una copia de seguridad incremental
    if ($archivosModificados.Count -gt 0) {
        Compress-Archive -Path $archivosModificados -DestinationPath "$rutaDestino\$nombreArchivo" -Force
    }
}

# Mostrar mensaje de éxito
Write-Host "Copia de seguridad incremental de la carpeta 'Documentos' realizada correctamente."
Write-Host "Archivo comprimido: $rutaDestino\$nombreArchivo"
