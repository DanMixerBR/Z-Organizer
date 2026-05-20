@echo off
title Zarfolder Updater
cls

:: ANSI Color Definitions
set "ESC="
set "G=%ESC%[92m"
set "C=%ESC%[96m"
set "W=%ESC%[0m"
set "Y=%ESC%[93m"

echo %C%=======================================================%W%
echo           %G%Zarfolder%W% - %Y%Update Manager%W%
echo %C%=======================================================%W%
echo.

echo %C%[%W%*%C%]%W% Status: %Y%Waiting for the app to close...%W%
timeout /t 3 /nobreak >nul

echo %C%[%W%*%C%]%W% Status: %Y%Extracting new files...%W%
powershell -command "Expand-Archive -Path 'Zarfolder_Windows.zip' -DestinationPath '..' -Force"

del /f /q "Zarfolder_Windows.zip"

echo.
echo %G%-------------------------------------------------------%W%
echo   [SUCCESS] Update completed!
echo   Please restart the app.
echo %G%-------------------------------------------------------%W%
echo.

timeout /t 5

:: Self-deletion logic to keep the workspace clean
start /b "" cmd /c "timeout /t 1 >nul & del /f /q "%~f0""
exit
