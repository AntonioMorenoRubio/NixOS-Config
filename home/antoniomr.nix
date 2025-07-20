{ config, pkgs, ... }:

{
  home.username = "antoniomr";
  home.homeDirectory = "/home/antoniomr";

  home.stateVersion = "25.05"; # ¡NO lo cambies una vez definido!

  programs.home-manager.enable = true;

  # Ejemplo de aplicaciones y configuración
  programs.git = {
    enable = true;
    userName = "AntonioMorenoRubio";
    userEmail = "amrinformatica10@gmail.com";
  };

  home.packages = with pkgs; [
    htop
    floorp
  ];
}
