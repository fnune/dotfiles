{ config, pkgs, ... }:

{
  home.username = "fausto";
  home.homeDirectory = "/home/fausto";
  home.stateVersion = "22.05";

  home.packages = [
    # FIXME: cursor appears half the size in flameshot? Not respecting GNOME's scaling?
    # pkgs.flameshot
  ];

  programs.home-manager.enable = true;
}
