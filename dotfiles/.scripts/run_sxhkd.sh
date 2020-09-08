#!/bin/bash

killall -q sxhkd

export PACTL_SINK=$(pactl list short sinks | grep analog | cut -f1)

sxhkd
