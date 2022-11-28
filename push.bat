@echo off

call pushconfig.cmd

:: moves the file to branch
move "public" "%OPTION_2"

echo Build Complete.
timeout /t 2 /nobreak