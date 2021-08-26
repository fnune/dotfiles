#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f /etc/X11/xinit/xinitrc.d/50-systemd-user.sh ]] && source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

export QT_QPA_PLATFORMTHEME=qt5ct

exec /usr/bin/i3
