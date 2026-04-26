#!/usr/sbin/env bash

hyprctl reload
swaync-client -R && swaync-client -rs

pkill waybar; pkill swaybg
kill $(pgrep -f walls_shuffler.sh)

sleep 0.25

waybar
exec ~/dotfiles/scripts/walls_shuffler.sh
