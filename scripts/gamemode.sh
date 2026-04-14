#!/usr/bin/env bash

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

  pkill waybar; pkill swaybg

  sleep 0.25

  waybar -s ~/.config/waybar/style_1.css -c ~/.config/waybar/config_1.jsonc
  swaybg -m stretch -i ~/dotfiles/backgrounds/default.png

  swaync-client -R && swaync-client -rs
  exit
else
  hyprctl reload
  pkill waybar; pkill swaybg
  
  sleep 0.25

  waybar
  swaybg -c 000000

  swaync-client -R && swaync-client -rs
  exit 0
fi
exit 1
