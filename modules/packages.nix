{ config, pkgs, ... }:

let
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
    dotnet-sdk #.NET 8 / C# 12
    dotnet-sdk_9
    jetbrains.rider
    neovim

    # Required for AppImages (Including Turtle WoW)
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

    # Nerdfonts
    nerd-fonts.0xproto
    nerd-fonts._3270
    nerd-fonts.agave
    nerd-fonts.anonymice
    nerd-fonts.arimo
    nerd-fonts.aurulent-sans-mono
    nerd-fonts.bigblue-terminal
    nerd-fonts.bitstream-vera-sans-mono
    nerd-fonts.blex-mono
    nerd-fonts.caskaydia-cove
    nerd-fonts.caskaydia-mono
    nerd-fonts.code-new-roman
    nerd-fonts.comic-shanns-mono
    nerd-fonts.commit-mono
    nerd-fonts.cousine
    nerd-fonts.d2coding
    nerd-fonts.daddy-time-mono
    nerd-fonts.departure-mono
    nerd-fonts.dejavu-sans-mono
    nerd-fonts.droid-sans-mono
    nerd-fonts.envy-code-r
    nerd-fonts.fantasque-sans-mono
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.geist-mono
    nerd-fonts.go-mono
    nerd-fonts.gohufont
    nerd-fonts.hack
    nerd-fonts.hasklug
    nerd-fonts.heavy-data
    nerd-fonts.hurmit
    nerd-fonts.im-writing
    nerd-fonts.inconsolata
    nerd-fonts.inconsolata-go
    nerd-fonts.inconsolata-lgc
    nerd-fonts.intone-mono
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
    nerd-fonts.iosevka-term-slab
    nerd-fonts.jetbrains-mono
    nerd-fonts.lekton
    nerd-fonts.liberation
    nerd-fonts.lilex
    nerd-fonts.martian-mono
    nerd-fonts.meslo-lg
    nerd-fonts.monaspace
    nerd-fonts.monofur
    nerd-fonts.monoid
    nerd-fonts.mononoki
    nerd-fonts.mplus
    nerd-fonts.noto
    nerd-fonts.open-dyslexic
    nerd-fonts.overpass
    nerd-fonts.profont
    nerd-fonts.proggy-clean-tt
    nerd-fonts.recursive-mono
    nerd-fonts.roboto-mono
    nerd-fonts.shure-tech-mono
    nerd-fonts.sauce-code-pro
    nerd-fonts.space-mono
    nerd-fonts.symbols-only
    nerd-fonts.terminess-ttf
    nerd-fonts.tinos
    nerd-fonts.ubuntu
    nerd-fonts.ubuntu-mono
    nerd-fonts.ubuntu-sans
    nerd-fonts.victor-mono
    nerd-fonts.zed-mono

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
