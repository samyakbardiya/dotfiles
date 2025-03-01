#!/usr/bin/env sh

if [ ! $(pgrep "spotifyd") ]; then
  spotifyd
fi

spt
