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
$nombreArchivo = "$fecha-docs_tot.zip"

# Comprimir la carpeta "Documentos"
Compress-Archive -Path $rutaDocumentos -DestinationPath "$rutaDestino\$nombreArchivo" -Force

# Mostrar mensaje de éxito
Write-Host "Copia de seguridad de la carpeta 'Documentos' realizada correctamente."
Write-Host "Archivo comprimido: $rutaDestino\$nombreArchivo"