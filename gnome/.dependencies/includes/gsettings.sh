#!/usr/bin/env bash

# These are keybindings I don't use and that would interrupt me
# if they were set, and I were to use them accidentally
KEYBINDINGS_TO_UNSET=(
  switch-to-workspace-down
  switch-to-workspace-last
  switch-to-workspace-left
  switch-to-workspace-right
  switch-to-workspace-up
  move-to-workspace-down
  move-to-workspace-last
  move-to-workspace-left
  move-to-workspace-right
  move-to-workspace-up
  maximize
  unmaximize
)

for setting in $KEYBINDINGS_TO_UNSET
do
  gsettings set org.gnome.desktop.wm.keybindings $setting "[]"
done

# Use 10 fixed workspaces
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 10

# Disable Gnome default keybindings that cobble Super + Number
gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false
for application in {1..9}
do
  gsettings set org.gnome.shell.keybindings switch-to-application-$application "[]"
done

# Switching to workspaces and moving windows to workspaces workspace numbers
for workspace in {1..9}
do
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$workspace "['<Super>$workspace']"
  gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$workspace "['<Super><Shift>$workspace']"
done

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 "['<Super>0']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 "['<Super><Shift>0']"

# Maximizing and full-screen
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Super>f']"
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Super><Shift>F']"

# Closing windows
gsettings set org.gnome.desktop.wm.keybindings close "['<Super><Shift>Q']"

# Moving windows to a side of the screen using hjkl
gsettings set org.gnome.desktop.wm.keybindings move-to-side-w "['<Super><Shift>H']"
gsettings set org.gnome.desktop.wm.keybindings move-to-side-s "['<Super><Shift>J']"
gsettings set org.gnome.desktop.wm.keybindings move-to-side-n "['<Super><Shift>K']"
gsettings set org.gnome.desktop.wm.keybindings move-to-side-e "['<Super><Shift>L']"

# Moving windows to a different monitor using hjkl
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left "['<Ctrl><Shift>H']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-down "['<Ctrl><Shift>J']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-up "['<Ctrl><Shift>K']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right "['<Ctrl><Shift>L']"

# Make it so that windows gain focus by clicking instead of hovering
gsettings set org.gnome.desktop.wm.preferences focus-mode 'click'

# Activate edge tiling
gsettings set org.gnome.mutter edge-tiling true

# Set the keyboard repeat delay and interval
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 15
gsettings set org.gnome.desktop.peripherals.keyboard delay 200

# A text scaling factor that works great on my monitor
gsettings set org.gnome.desktop.interface text-scaling-factor 1

# Stop the Super key from opening the overview and choose another shortcut
gsettings set org.gnome.mutter overlay-key ""
gsettings set org.gnome.shell.keybindings toggle-overview "['<Super>d']"
