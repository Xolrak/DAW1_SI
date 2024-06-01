# Función para calcular el factorial de un número
function Get-Factorial {
    param (
        [int]$number
    )

    # Inicializamos la variable para almacenar el resultado del factorial
    $factorial = 1

    # Bucle para calcular el factorial
    for ($i = $number; $i -ge 1; $i--) {
        $factorial *= $i
    }

    # Devolvemos el resultado del factorial
    return $factorial
}

# Bucle principal para permitir múltiples cálculos
do {
    # Pedimos al usuario que introduzca un número
    $number = Read-Host "Introduce un número para calcular su factorial"

    # Convertimos la entrada a un entero y calculamos el factorial
    $factorial = Get-Factorial -number [int]$number

    # Mostramos el resultado
    Write-Host "El factorial de $number es: $factorial"

    # Preguntamos al usuario si quiere continuar
    $continue = Read-Host "¿Quieres calcular el factorial de otro número? (s/n)"
} while ($continue -eq 's' -or $continue -eq 'S')

# Mensaje de despedida
Write-Host "Gracias por usar el programa. ¡Adiós!"
