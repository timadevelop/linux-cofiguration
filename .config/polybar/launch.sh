#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

for m in $(polybar --list-monitors | cut -d":" -f1); do
  if [[ $m == "*HDMI*" ]]; then
    MONITOR2=$m polybar --reload extmon &
  else
    MONITOR1=$m polybar --reload primary &
  fi
done
# polybar primary &

# Attemp to launch external monitor polybar (Fails if extmon isn't present)
# polybar extmon &

echo "Bars launched..."

