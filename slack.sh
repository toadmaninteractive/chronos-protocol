#!/bin/sh

mono bin/igorc.exe -d -v -t erlang \
    -p igor/slack \
    -o generated/slack \
  *.igor
