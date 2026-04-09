#! /usr/bin/bash

hyprctl reload
swaync-client -R && swaync-client -rs
pkill waybar && waybar
pkill swaybg && swaybg --mode stretch --image ~/dotfiles/backgrounds/default.png
