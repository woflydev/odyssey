@echo off
setlocal

call buildconfig.cmd

echo build_finalize.bat is called.
pause

:: start loop to get user-secified path
:getpath
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

goto getpath


:: start of options
:option1
echo You selected %choice%.
::cd %OPTION_1%
::del /s *

FOR /d %%a IN ("%OPTION_1%\*") DO IF /i NOT "%%~nxa"=="%keepdir%" RD /S /Q "%%a"
FOR %%a IN ("%OPTION_1%\*") DO IF /i NOT "%%~nxa"=="%keepfile%" DEL "%%a"

echo HOME DIR NAVIGATION
timeout /t 3 /nobreak
cd "%HOME_DIR%\public"

:: moves the file to branch
xcopy /s * %OPTION_1%

cd %OPTION_1%

goto push


:: option number 2
:option2
echo You selected %choice%.
::cd %OPTION_2%
::del /s *

FOR /d %%a IN ("%OPTION_2%\*") DO IF /i NOT "%%~nxa"=="%keepdir%" RD /S /Q "%%a"
FOR %%a IN ("%OPTION_2%\*") DO IF /i NOT "%%~nxa"=="%keepfile%" DEL "%%a"

echo HOME DIR NAVIGATION
timeout /t 3 /nobreak
cd "%HOME_DIR%\public"

:: moves the file to branch
xcopy /s * %OPTION_2%

cd %OPTION_2%

goto push


:: end of the program, exit.
:push
set /p commitmsg=Commit Message/Name: 

git init
git add .
git commit -m "[UPDATER] => %commitmsg%"
git push origin main

echo Script run complete.
timeout /t 2 /nobreak