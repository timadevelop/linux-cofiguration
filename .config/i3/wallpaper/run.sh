#!/bin/bash

killall -q xwinwrap

xwinwrap -g 2560x1080 -ni -s -nf -b -un -argb  -ov -sh rectangle -- gifview -w WID /home/vlad/.config/i3/wallpaper/my_2.gif -a --min-delay=${1:-5} --no-interactive --memory-limit 128 --window root
