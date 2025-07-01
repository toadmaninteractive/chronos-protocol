#!/bin/sh

mono bin/igorc.exe -d -v -t ts \
    -p igor/common \
    -p igor/web \
    -o generated/web \
  *.igor

cp ts/igor.ts generated/web
