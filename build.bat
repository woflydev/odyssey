@echo off

call pushconfig.cmd

:: start loop to get path
:path
ECHO.
ECHO 1. Target Path - %OPTION_1%
ECHO 2. Target Path - %OPTION_2%

set choice=
set /p choice=input option no. for target path.

if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto option1
if '%choice%'=='2' goto option2

ECHO "%choice%" is not a valid option, please try again.
ECHO.

goto start

:: deletes old public folder
rd /s /q "public"

:: option 1
:option1
echo Starting build...
timeout /t 1 /nobreak

:: generates new site
yarn run build

:option2
echo Starting build...
timeout /t 1 /nobreak

:: generates new site
yarn run build