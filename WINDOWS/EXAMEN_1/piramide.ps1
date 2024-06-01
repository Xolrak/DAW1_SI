$height = 5
for ($i = 1; $i -le $height; $i++) {
    $spaces = " " * ($height - $i)
    $stars = "*" * (2 * $i - 1)
    Write-Output "$spaces$stars"
}
