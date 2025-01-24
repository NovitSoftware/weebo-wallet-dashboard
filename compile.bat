@echo off

REM Compile the PBIX file
pbi-tools compile Dashboard PBIT PBIT -overwrite True

REM Pause to keep the command prompt open
pause