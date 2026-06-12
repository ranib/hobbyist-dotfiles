#!/usr/bin/env bash

WALL_DIR="$HOME/Wallpapers"
WALL=$(find "$WALL_DIR" -type f | shuf -n 1)

types=(wipe any)
chosen=${types[$RANDOM % ${#types[@]}]}

awww img "$WALL" --transition-type "$chosen" --transition-fps 60 --transition-duration 1

NIRI=/tmp/blurred_wall.jpg

status=$(ps -C niri -o comm=)
if [[ $status == "niri" ]]; then 
  ffmpeg -y -hwaccel vaapi -i "$WALL" -vf "format=yuv420p,boxblur=20:5,eq=contrast=1.1:saturation=1.8" "$NIRI"
  awww img --namespace niri "$NIRI" --transition-type "$chosen" --transition-fps 60 --transition-duration 1
fi

# sleep 1 && notify-send "Wallpaper changed" "$(basename "$WALL")" -i "$WALL"

# pkill swaybg
# swaybg -i "$WALL" -m fill &
