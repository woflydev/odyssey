@echo off

call buildconfig.cmd

echo Starting build...
timeout /t 1 /nobreak

:: deletes old public folder
rd /s /q "public"

echo old site cache removed.
timeout /t 2 /nobreak

:: generates new site
yarn run build