## Carlos C de DAW1 ##
$origen = "$HOME\Desktop"
$destinacion = "F:\Backup\"
$date = Get-Date -Format "yyyy-MM-dd"
if (!(Test-Path -Path $destinacion)) {
    New-Item -ItemType Directory -Path $destinacion
}
# Se asigna el nombre al archivo ZIP
$zip = $destinacion + $date + ".zip"
Compress-Archive -Path $origen -DestinationPath $zip -Force
Copy-Item -Path $origen -Destination $destinacion -Recurse -Force