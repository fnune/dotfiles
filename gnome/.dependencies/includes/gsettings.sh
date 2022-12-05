#!/usr/bin/env bash

set -ux

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

# Allow installing unsupported extensions
gsettings set org.gnome.shell disable-extension-version-validation true

# Stop alt-tab from showing windows from other workspaces
gsettings set org.gnome.shell.app-switcher current-workspace-only true

# Place new windows centered
gsettings set org.gnome.mutter center-new-windows true

# GNOME 3.38 does not yet ship with the Appearance settings tab
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

# Switch application windows instead of applications with Alt + Tab
gsettings set org.gnome.desktop.wm.keybindings switch-applications "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"

# [0/4] Replace print keybindings with flameshot and add Super + Return for Alacritty
CK_FLAMESHOT_SCREEN="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
CK_FLAMESHOT_GUI="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
CK_ALACRITTY="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
CK_ADD_INBOX="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[\
  '$CK_FLAMESHOT_SCREEN', \
  '$CK_FLAMESHOT_GUI', \
  '$CK_ALACRITTY', \
  '$CK_ADD_INBOX'\
]"

# [1/4] Full-screen shot
gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$CK_FLAMESHOT_SCREEN binding "Print"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$CK_FLAMESHOT_SCREEN command "flameshot full -c -p $HOME/Pictures/Screenshots"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$CK_FLAMESHOT_SCREEN name "flameshot full"

# [2/4] Area screenshot
gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$CK_FLAMESHOT_GUI binding "<Shift>Print"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$CK_FLAMESHOT_GUI command "flameshot gui"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$CK_FLAMESHOT_GUI name "flameshot gui"

# [3/4] Open Alacritty
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$CK_ALACRITTY binding "<Super>Return"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$CK_ALACRITTY command "alacritty"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$CK_ALACRITTY name "alacritty"

# [4/4] Add something to my inbox
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$CK_ADD_INBOX binding "<Super>i"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$CK_ADD_INBOX command "add-inbox-alacritty"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$CK_ADD_INBOX name "add-inbox-alacritty"

# Disable hot corners
gsettings set org.gnome.desktop.interface enable-hot-corners false

# Show weekdays in the calendar
gsettings set org.gnome.desktop.calendar show-weekdate true

# Make caps an additional escape and use the right-super key as the compose key
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape', 'compose:rwin']"

# Use Inter as a desktop font
gsettings set org.gnome.desktop.interface font-name 'Inter 11'
gsettings set org.gnome.desktop.interface document-font-name 'Inter 11'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Inter Bold 11'
