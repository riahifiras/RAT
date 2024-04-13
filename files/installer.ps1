# Function to generate random text for directory name
function random_text {
    $chars = ([char[]]([char]'A'..[char]'Z') + ([char[]]([char]'a'..[char]'z')))
    $randomChars = Get-Random -InputObject $chars -Count 5
    return -join $randomChars
}

# Variables
$wd = random_text
$path = Join-Path -Path $env:temp -ChildPath $wd
Write-Output $path

# Create directory if it doesn't exist
if (-not (Test-Path $path)) {
    New-Item -Path $path -ItemType Directory
}

# Change directory
Set-Location $path

# Now you can proceed with your script
Write-Output "" > poc.txt
Set-Location C:\Users\user\OneDrive\Bureau\rat\files
