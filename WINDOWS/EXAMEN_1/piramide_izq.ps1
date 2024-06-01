$height = 5
for ($i = 1; $i -le $height; $i++) {
    $stars = "*" * $i
    Write-Output "$stars"
}
for ($i = $height - 1; $i -ge 1; $i--) {
    $stars = "*" * $i
    Write-Output "$stars"
}
