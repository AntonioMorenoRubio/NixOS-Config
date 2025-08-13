{ config, lib, pkgs, ... }:

{
    nix = {
        gc = {  # Recolector de basura
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 14d";
        };
    };
}
