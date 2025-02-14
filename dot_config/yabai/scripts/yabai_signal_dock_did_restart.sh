#!/bin/bash

arc_window_id=$(yabai -m query --windows | jq '.[] | select(.app == "Arc") | .id' | head -n 1)
[[ -n $arc_window_id ]] &&
  yabai -m window "$arc_window_id" --space web --toggle float
