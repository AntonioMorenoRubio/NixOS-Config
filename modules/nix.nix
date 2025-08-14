{ config, lib, pkgs, ... }:

{
    nix = {
        gc = {  # Recolector de basura
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 14d";
        };

        optimise = {
            automatic = true;
            dates = [ "weekly" ];
        };

        settings = {
            auto-optimise-store = false; # If false, use 'nix-store --optimise' manually. WARNING: Can be long operation
        };
    };
}
