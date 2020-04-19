xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

/home/vlad/.config/i3/xrandr.sh

xset +fp /home/vlad/.local/share/fonts
xset fp rehash

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
exec i3
