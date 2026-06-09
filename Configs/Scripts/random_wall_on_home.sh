#!/usr/bin/env bash

WALL_DIR="$HOME/Wallpapers"

WALL=$(find "$WALL_DIR" -type f | shuf -n 1)

# pkill swaybg

# swaybg -i "$WALL" -m fill &

awww img "$WALL" --transition-type random --transition-fps 60 --transition-duration 1

# sleep 1 && notify-send "Wallpaper changed" "$(basename "$WALL")" -i "$WALL"
