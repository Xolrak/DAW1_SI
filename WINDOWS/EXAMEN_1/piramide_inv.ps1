$height = 5
for ($i = $height; $i -ge 1; $i--) {
    $spaces = " " * ($height - $i)
    $stars = "*" * (2 * $i - 1)
    Write-Output "$spaces$stars"
}
