#!/bin/sh

mono bin/igorc.exe -d -v -t erlang -x 'generl/*.cs' \
    -p igor/common \
    -p igor/server \
    -p igor/web \
    -o "$PWD/generated/erlang" \
  *.igor
