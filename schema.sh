#!/bin/sh

mono bin/igorc.exe -d -v -t schema \
    -p igor/common \
    -p igor/server \
    -p igor/web \
    -o generated/schema \
  *.igor
