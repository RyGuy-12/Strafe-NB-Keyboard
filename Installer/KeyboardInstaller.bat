@echo off
setlocal

echo Searching for NohBoard...

:: Common install locations
set "NB1=%USERPROFILE%\Desktop\NohBoard-ReWrite-v1.3.0"
set "NB2=%USERPROFILE%\Downloads\NohBoard-ReWrite-v1.3.0"
set "NB3=%USERPROFILE%\OneDrive\Documents\NohBoard-ReWrite-v1.3.0"

set "NOHBOARD="

if exist "%NB1%\NohBoard.exe" set "NOHBOARD=%NB1%"
if exist "%NB2%\NohBoard.exe" set "NOHBOARD=%NB2%"
if exist "%NB3%\NohBoard.exe" set "NOHBOARD=%NB3%"

if "%NOHBOARD%"=="" (
    echo Could not find NohBoard automatically.
    echo Please enter the full path to your NohBoard folder:
    set /p NOHBOARD=
)

if not exist "%NOHBOARD%\keyboards" (
    echo Keyboards folder not found!
    pause
    exit /b
)

echo Extracting keyboard...

powershell -command "Expand-Archive -Force '%~dp0Strafe.zip' '%NOHBOARD%\keyboards'"

echo Done!
echo Your keyboard has been installed.
pause