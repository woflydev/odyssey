@echo off
setlocal

call buildconfig.cmd

echo [SYSTEM] HEIRARCHY CLEANUP AND WEBSITE PUSH...
timeout /t 1 /nobreak

::-----------------------------------------------------------------------------------::

:: start loop to get user-secified path
:getpath
echo.
echo IF PATH IS NOT AN OPTION, EDIT buildconfig.cmd AND BELOW LINES RESPECTIVELY.
echo 1. Target Path - %OPTION_1%
echo 2. Target Path - %OPTION_2%
echo 3. Target Path - %OPTION_3%
echo 4. Target Path - %OPTION_4%
echo 5. Target Path - %OPTION_5%
echo 6. Target Path - %OPTION_6%

set choice=
set /p choice=[SYSTEM] INPUT OPTION NUMBER FOR TARGET REPOSITORY'S LOCAL PATH: 

if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' call :execute %OPTION_1%
if '%choice%'=='2' call :execute %OPTION_2%
if '%choice%'=='3' call :execute %OPTION_3%
if '%choice%'=='4' call :execute %OPTION_4%
if '%choice%'=='5' call :execute %OPTION_5%
if '%choice%'=='6' call :execute %OPTION_6%

echo.
echo [SYSTEM] "%choice%" IS NOT AN OPTION, PLEASE TRY AGAIN.
echo.

goto getpath

::-----------------------------------------------------------------------------------::

:execute

echo %~1\.git
::timeout /t 800 /nobreak

if exist %~1\.git\ (
	echo Directory Exists!
) else (
	echo. && echo An error was found. Most likely the path specified does not exist! && goto getpath
)

FOR /d %%a IN ("%~1\*") DO IF /i NOT "%%~nxa"=="%keepdir%" RD /S /Q "%%a"
FOR %%a IN ("%~1\*") DO IF /i NOT "%%~nxa"=="%keepfile%" DEL "%%a"

cd "%HOME_DIR%\public"

:: moves the file to branch
xcopy /s * %~1

:: changes working directory to input folder
cd %~1

goto push

::::-----------------------------------------------------------------------------------::
::
:::: start of options
:::option1
::::echo You selected %choice%.
::::cd %OPTION_1%
::::del /s *
::
::FOR /d %%a IN ("%OPTION_1%\*") DO IF /i NOT "%%~nxa"=="%keepdir%" RD /S /Q "%%a"
::FOR %%a IN ("%OPTION_1%\*") DO IF /i NOT "%%~nxa"=="%keepfile%" DEL "%%a"
::
::::echo HOME DIR NAVIGATION
::::timeout /t 3 /nobreak
::cd "%HOME_DIR%\public"
::
:::: moves the file to branch
::xcopy /s * %OPTION_1%
::
::cd %OPTION_1%
::
::goto push
::
::::-----------------------------------------------------------------------------------::
::
:::: option number 2
:::option2
::::echo You selected %choice%.
::::cd %OPTION_2%
::::del /s *
::
::FOR /d %%a IN ("%OPTION_2%\*") DO IF /i NOT "%%~nxa"=="%keepdir%" RD /S /Q "%%a"
::FOR %%a IN ("%OPTION_2%\*") DO IF /i NOT "%%~nxa"=="%keepfile%" DEL "%%a"
::
::::echo HOME DIR NAVIGATION
::::timeout /t 3 /nobreak
::cd "%HOME_DIR%\public"
::
:::: moves the file to branch
::xcopy /s * %OPTION_2%
::
::cd %OPTION_2%
::
::goto push
::
::::-----------------------------------------------------------------------------------::
::
:::option3
::::echo You selected %choice%.
::::cd %OPTION_2%
::::del /s *
::
::FOR /d %%a IN ("%OPTION_3%\*") DO IF /i NOT "%%~nxa"=="%keepdir%" RD /S /Q "%%a"
::FOR %%a IN ("%OPTION_3%\*") DO IF /i NOT "%%~nxa"=="%keepfile%" DEL "%%a"
::
::::echo HOME DIR NAVIGATION
::::timeout /t 3 /nobreak
::cd "%HOME_DIR%\public"
::
:::: moves the file to branch
::xcopy /s * %OPTION_3%
::
::cd %OPTION_3%
::
::goto push
::
::::-----------------------------------------------------------------------------------::
::
:::option4
::::echo You selected %choice%.
::::cd %OPTION_2%
::::del /s *
::
::FOR /d %%a IN ("%OPTION_4%\*") DO IF /i NOT "%%~nxa"=="%keepdir%" RD /S /Q "%%a"
::FOR %%a IN ("%OPTION_4%\*") DO IF /i NOT "%%~nxa"=="%keepfile%" DEL "%%a"
::
::::echo HOME DIR NAVIGATION
::::timeout /t 3 /nobreak
::cd "%HOME_DIR%\public"
::
:::: moves the file to branch
::xcopy /s * %OPTION_4%
::
::cd %OPTION_4%
::
::goto push
::
::::-----------------------------------------------------------------------------------::
::
:::option5
::::echo You selected %choice%.
::::cd %OPTION_2%
::::del /s *
::
::FOR /d %%a IN ("%OPTION_5%\*") DO IF /i NOT "%%~nxa"=="%keepdir%" RD /S /Q "%%a"
::FOR %%a IN ("%OPTION_5%\*") DO IF /i NOT "%%~nxa"=="%keepfile%" DEL "%%a"
::
::::echo HOME DIR NAVIGATION
::::timeout /t 3 /nobreak
::cd "%HOME_DIR%\public"
::
:::: moves the file to branch
::xcopy /s * %OPTION_5%
::
::cd %OPTION_5%
::
::goto push
::
::::-----------------------------------------------------------------------------------::
::
:::option6
::::echo You selected %choice%.
::::cd %OPTION_2%
::::del /s *
::
::FOR /d %%a IN ("%OPTION_6%\*") DO IF /i NOT "%%~nxa"=="%keepdir%" RD /S /Q "%%a"
::FOR %%a IN ("%OPTION_6%\*") DO IF /i NOT "%%~nxa"=="%keepfile%" DEL "%%a"
::
::::echo HOME DIR NAVIGATION
::::timeout /t 3 /nobreak
::cd "%HOME_DIR%\public"
::
:::: moves the file to branch
::xcopy /s * %OPTION_6%
::
::cd %OPTION_6%
::
::goto push
::
::::-----------------------------------------------------------------------------------::

:: end of the program, exit.
:push
echo.

echo [SYSTEM] PULLING FROM REMOTE, PLEASE BE PATIENT...
git pull %TARGET_REPOSITORY% main

echo.

set /p commitmsg=Commit Message/Name: 

echo.

git init
git add .
git commit -m "[UPDATER] => %commitmsg%"
git push origin main

echo Script run complete.

exit

::-----------------------------------------------------------------------------------::