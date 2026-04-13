#!/usr/bin/env bash

hyprctl reload
swaync-client -R && swaync-client -rs

pkill waybar; pkill swaybg

sleep 0.25

waybar
swaybg -m stretch -i ~/dotfiles/backgrounds/default.png
