{ config, pkgs, ... }:

let
  # Anime Game Launcher
  aagl = import (builtins.fetchTarball "https://github.com/ezKEa/aagl-gtk-on-nix/archive/release-24.11.tar.gz");

  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Install Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the   firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the   firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open   ports in the firewall for Steam Local Network Game   Transfers
  };

  # Anime Game Launcher
  imports = [
    ../cachix.nix
    aagl.module
  ];

  nix.settings = aagl.nixConfig; # Set up Cachix
  programs.honkers-railway-launcher.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ntfs3g
    git

    # Desarrollo
    ## .NET
    dotnet-sdk #.NET 8 / C# 12
    dotnet-sdk_9
    jetbrains.rider

    # Required for AppImages (Including Turtle WoW)
    appimage-run

    # Star Wars Galaxies Reckoning Requirements
    protonplus
    lutris

    # Comunicaciones
    discord
    telegram-desktop
    zapzap

    logseq

    krita
    unstable.gimp3

  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-27.3.11" # Required for logseq
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
