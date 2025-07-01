@echo off
setlocal enableextensions enabledelayedexpansion

set out_dir="generated\web"

bin\igorc.exe -d -v -t ts ^
  -p "igor\common" ^
  -p "igor\web" ^
  -o %out_dir% ^
  *.igor

if errorlevel 1 pause && exit

copy /B /V /Y "ts\igor.ts" %out_dir%

if errorlevel 1 pause && exit

endlocal
