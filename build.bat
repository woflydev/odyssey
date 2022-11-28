@echo off

call buildconfig.cmd

echo [SYSTEM] STARTING BUILD...
timeout /t 1 /nobreak

:: deletes old public folder
rd /s /q "public"

echo [SYSTEM] OLD SITE CACHE REMOVED.

:: generates new site
yarn run build