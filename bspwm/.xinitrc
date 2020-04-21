eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

setxkbmap es -option "caps:escape"
xset r rate 220 50
xrandr --dpi 96
xsetroot -cursor_name left_ptr

exec bspwm
