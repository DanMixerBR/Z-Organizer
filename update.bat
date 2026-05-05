@echo off
echo Updating the Z-Organizer...
timeout /t 3 /nobreak >nul

tar -xf Z-Organizer_Windows.zip

del Z-Organizer_Windows.zip

start Z-Organizer.exe

del "%~f0"
