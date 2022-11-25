#!/bin/bash

set -euxo pipefail

# Multi-user install of nix:
if ! command -v nix-env &> /dev/null
then
  sh <(curl -L https://nixos.org/nix/install) --daemon
fi

# Support for desktop icons from nix-installed packages:
if ! grep .nix-profile $HOME/.profile
then
  echo 'export XDG_DATA_DIRS="$HOME/.nix-profile/share:$XDG_DATA_DIRS"' >> $HOME/.profile
fi

# Wanted by home manager:
if ! grep .nix-defexpr $HOME/.profile
then
  echo 'export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}' >> $HOME/.profile
fi

source $HOME/.profile

# Install home manager
# https://nix-community.github.io/home-manager/index.html#sec-install-standalone
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

# Add rnix-lsp for vim support
nix-env -i -f https://github.com/nix-community/rnix-lsp/archive/master.tar.gz
