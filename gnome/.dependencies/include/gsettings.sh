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

# Switching to workspaces and moving windows to workspaces workspace numbers
for workspace in {1..10}
do
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$workspace "['<Super>$workspace']"
  gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$workspace "['<Super><Shift>$workspace']"
done

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

# Set the user theme to "Inter", defined in gnome/.themes
gsettings set org.gnome.shell.extensions.user-theme name "Inter"
