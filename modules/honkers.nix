{ config, pkgs, ... }:

let
  # Anime Game Launcher
  aagl = import (builtins.fetchTarball "https://github.com/ezKEa/aagl-gtk-on-nix/archive/release-25.05.tar.gz");
in
{
  # Cachix. Necesario para el Launcher
  nix.settings = {
    substituters = [ "https://ezkea.cachix.org" ];
    trusted-public-keys = [ "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=" ];
  };
  imports = [ aagl.module ];
  programs.honkers-railway-launcher.enable = true;
}
