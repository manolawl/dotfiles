#!/usr/sbin/env bash

HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')

if [ "$HYPRGAMEMODE" = 1 ] ; then
  hyprctl --batch "\
    keyword animations:enabled 0;\
    keyword animation borderangle,0; \
    keyword decoration:shadow:enabled 0;\
    keyword decoration:blur:enabled 0;\
    keyword decoration:fullscreen_opacity 1;\
    keyword general:border_size 0;\
    keyword decoration:rounding 0"
  exit
else
  hyprctl reload
  exit 0
fi
exit 1
