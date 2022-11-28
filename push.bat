@echo off

call pushconfig.cmd

echo push.bat is called.
pause

:: moves the file to branch
move /y "public\*" %OPTION_2%\

echo Build Complete.
timeout /t 2 /nobreak