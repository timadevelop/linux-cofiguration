#!/bin/bash
xrandr --auto
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

MODE_NAME=2560x1080_60

setup_monitors() {
  [[ -z $1 ]] && echo "No primary monitor"
  [[ -z $2 ]] && echo "No secondary monitor"
  echo "Setting up $1 and $2 monitors..."

  xrandr --rmmode "$MODE_NAME"
  xrandr --newmode "$MODE_NAME"  230.76  2560 2728 3000 3440  1080 1081 1084 1118  -HSync +Vsync

  xrandr --addmode $2 $MODE_NAME

  xrandr --output $2 --left-of $1

  xrandr --output $2 --mode $MODE_NAME

  xrandr --output $2 --left-of $1

  xrandr --auto

  nitrogen --restore
}


connected_monitors=$(xrandr | grep -w connected | cut -d " " -f 1)

setup_monitors $connected_monitors
