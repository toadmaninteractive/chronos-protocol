@echo off
setlocal enableextensions enabledelayedexpansion

set out_dir="generated\slack"

bin\igorc.exe -d -v -t erlang ^
  -p "igor\slack" ^
  -o %out_dir% ^
  *.igor

if errorlevel 1 pause && exit

endlocal
