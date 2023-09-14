#!/usr/bin/env bash

dir="$HOME/.dotfiles/kde"

rm -f "$dir/$USER"_transfusion_*

"$dir/transfuse.sh" -b "$USER"
