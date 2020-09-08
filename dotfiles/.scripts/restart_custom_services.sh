#!/bin/bash

systemctl restart --user picom.service sxhkd.service
# polybar.service
~/.config/polybar/launch.sh 2&> /dev/null &
