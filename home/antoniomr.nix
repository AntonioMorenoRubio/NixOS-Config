{ config, pkgs, ... }:

{
  home.username = "antoniomr";
  home.homeDirectory = "/home/antoniomr";

  home.stateVersion = "25.05"; # ¡NO lo cambies una vez definido!

  # Ejemplo de aplicaciones y configuración
  programs = {
	home-manager = {
	    enable = true;
	};

	git = {
	    enable = true;
	    userName = "AntonioMorenoRubio";
	    userEmail = "amrinformatica10@gmail.com";
	};

	kitty = {
	    enable = true;
	    font = {
		name = "Fira Code";
		size = 10;
	    };
	};
  };

  home.packages = with pkgs; [
    htop
    floorp
  ];
}
