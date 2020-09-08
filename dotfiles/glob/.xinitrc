xset +fp $HOME/.local/share/fonts
xset fp rehash

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

sleep 1s && $HOME/.scripts/configure_monitors.sh &&\
  $HOME/.scripts/init_keyboard_layouts.sh &&\
  $HOME/.scripts/restart_custom_services.sh &

exec i3
