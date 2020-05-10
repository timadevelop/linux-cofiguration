xset +fp $HOME/.local/share/fonts
xset fp rehash

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

$HOME/.scripts/configure_monitors.sh
$HOME/.scripts/restart_custom_services.sh


setxkbmap -model pc104 -layout us,ru -variant , -option grp:alt_shift_toggle

sxhkd &

$HOME/.config/polybar/launch.sh &

exec i3
