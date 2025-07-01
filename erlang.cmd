@echo off
setlocal enableextensions enabledelayedexpansion

set out_dir="generated\erlang"

bin\igorc.exe -d -v -t erl ^
  -x generl\*.cs ^
  -p "igor\common" ^
  -p "igor\server" ^
  -p "igor\web" ^
  -o %out_dir% ^
  *.igor

if errorlevel 1 pause && exit

endlocal
