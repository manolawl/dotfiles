#!/usr/bin/env bash

# config
#DIR="$HOME/dotfiles/backgrounds/mountains"
DIR="$BACKGROUNDS_DIR/4k_wallpapers_from_reddit"
INTERVAL=300   # seconds
MODE="fill"    # fill | fit | stretch | center | tile

# check deps
command -v swaybg >/dev/null 2>&1 || {
  echo "swaybg not found"
  exit 1
}

# loop
while true; do
  # pick random file
  WALL=$(find "$DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \) | shuf -n 1)

  # skip if none
  [ -z "$WALL" ] && sleep "$INTERVAL" && continue

  # kill old swaybg
  pkill -x swaybg

  # start new
  swaybg -i "$WALL" -m "$MODE" &

  # wait
  sleep "$INTERVAL"
done
