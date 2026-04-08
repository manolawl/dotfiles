#!/usr/bin/env sh
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
  hyprctl --batch "\
    keyword animations:enabled 0;\
    keyword animation borderangle,0; \
    keyword decoration:shadow:enabled 0;\
    keyword decoration:blur:enabled 0;\
    keyword decoration:fullscreen_opacity 1;\
    keyword general:gaps_in 0;\
    keyword general:gaps_out 0;\
    keyword general:border_size 0;\
    keyword decoration:rounding 0"
  pkill waybar && waybar -s ~/.config/waybar/style_1.css -c ~/.config/waybar/config_1.jsonc
  hyprctl notify 1 5000 "rgb(40a02b)" "Gamemode [ON]"
  exit
else
  hyprctl notify 1 5000 "rgb(d20f39)" "Gamemode [OFF]"
  hyprctl reload
  pkill waybar && waybar -s ~/.config/waybar/style.css -c ~/.config/waybar/config.jsonc
  exit 0
fi
exit 1
