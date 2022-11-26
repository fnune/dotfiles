#!/usr/bin/env bash

set -euxo pipefail

sudo apt install -y wget curl

wget -O gnome-shell-extension-installer "https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
chmod +x gnome-shell-extension-installer
sudo mv gnome-shell-extension-installer /usr/bin/

gnome-shell-extension-installer 2141 3.38  # https://extensions.gnome.org/extension/2141/horizontal-workspaces/
gnome-shell-extension-installer 3851 3.38  # https://extensions.gnome.org/extension/3851/workspaces-bar/
gnome-shell-extension-installer 517  3.38  # https://extensions.gnome.org/extension/517/caffeine/
gnome-shell-extension-installer 5278 --yes # https://extensions.gnome.org/extension/5278/pano/
gnome-shell-extension-installer 615  3.38  # https://extensions.gnome.org/extension/615/appindicator-support/
gnome-shell-extension-installer 959  3.38  # https://extensions.gnome.org/extension/959/disable-workspace-switcher-popup/
gnome-shell-extension-installer 906  3.38  # https://extensions.gnome.org/extension/906/sound-output-device-chooser/
