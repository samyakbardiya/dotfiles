#!/bin/bash

[[ $(yabai -m query --windows | grep -c '"app":"Arc"') -eq 1 ]] &&
  yabai -m space --focus web &&
  yabai -m window --space web --toggle float
