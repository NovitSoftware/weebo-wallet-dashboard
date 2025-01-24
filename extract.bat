@echo off

REM Check if a parameter is provided
IF "%1"=="" (
    echo Please provide the path to the PBIX file.
    exit /b 1
)

REM Extract the PBIX file
pbi-tools extract %1 -extractFolder Dashboard

REM Pause to keep the command prompt open
pause