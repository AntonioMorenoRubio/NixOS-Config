{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
  dotnetCombined = pkgs.dotnetCorePackages.combinePackages [
    pkgs.dotnet-sdk #.NET 8
    pkgs.dotnet-sdk_9
    pkgs.dotnet-sdk_6
  ];
in
{
  # Install firefox.
  programs.firefox.enable = true;

  nixpkgs.config = {
    allowUnfree = true; # Allow unfree packages
    permittedInsecurePackages = [
      "electron-27.3.11" # Required for logseq
      "dotnet-sdk-6.0.428" # .NET 6
    ];
  };

  # Install Steam
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  # Modo juego para el Sistema Operativo
  programs.gamemode.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ntfs3g
    git
    kdePackages.filelight
    gparted
    kdePackages.yakuake

    # Desarrollo
    ## .NET
    dotnetCombined
    jetbrains.rider

    ## Neovim
    neovim
    ### Dependencies for Kickstart.nvim
    gnumake
    unzip
    gcc
    ripgrep
    fd

    # Required for AppImages
    appimage-run

    # Star Wars Galaxies Reckoning Requirements
    protonplus
    lutris

    prismlauncher

    mangohud # Overlay de rendimiento para juegos hecho en Vulkan y OpenGL

    # RetroArch
    retroarch
    libretro.beetle-psx
    libretro.beetle-psx-hw
    libretro.ppsspp
    libretro.vba-m
    libretro.picodrive

    # Comunicaciones
    discord
    telegram-desktop
    zapzap

    # Oficina y documentación
    logseq
    onlyoffice-desktopeditors

    krita
    gimp3
    vlc

  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
