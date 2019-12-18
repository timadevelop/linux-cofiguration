#!/bin/bash

connected_monitors=$(xrandr | grep -w connected | cut -d " " -f 1)

echo $connected_monitors

if [[ $connected_monitors == *"HDMI2"* ]]; then
    xrandr --newmode "2560x1080_60.00"  230.76  2560 2728 3000 3440  1080 1081 1084 1118  -HSync +Vsync

    xrandr --addmode HDMI2 2560x1080_60.00

    xrandr --output HDMI2 --left-of eDP1

    xrandr --output HDMI2 --mode 2560x1080_60.00

    xrandr --output HDMI2 --left-of eDP1

    nitrogen --restore
fi

