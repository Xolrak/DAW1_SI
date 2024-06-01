$height = 5
for ($i = 1; $i -le $height; $i++) {
    $spaces = " " * ($height - $i)
    $stars = "*" * $i
    Write-Output "$spaces$stars"
}
for ($i = $height - 1; $i -ge 1; $i--) {
    $spaces = " " * ($height - $i)
    $stars = "*" * $i
    Write-Output "$spaces$stars"
}
