@echo off
setlocal enableextensions enabledelayedexpansion

set out_dir="generated\schema"

bin\igorc.exe -d -v -t schema ^
  -p "igor\common" ^
  -p "igor\server" ^
  -p "igor\web" ^
  -o %out_dir% ^
  *.igor

if errorlevel 1 pause && exit

endlocal
