{
  description = "Mi Configuración de NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    #Other inputs
    aagl.url = "github:ezKEa/aagl-gtk-on-nix/release-25.05";
    aagl.inputs.nixpkgs.follows = "nixpkgs"; # Name of nixpkgs input you want to use

    autofirma-nix = {
      url = "github:nix-community/autofirma-nix";  # For nixpkgs-unstable
      # url = "github:nix-community/autofirma-nix/release-24.11";  # For NixOS 24.11
      inputs.nixpkgs.follows = "unstable";
    };
  };

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  outputs = { self, nixpkgs, aagl, unstable, autofirma-nix }:
    let
      system = "x86_64-linux";

      packages = import nixpkgs {
        inherit system;

        config = {
          allowUnfree = true;
        };
      };

    in
    {

      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit system; };

          modules = [
            ./configuration.nix
            {
              imports = [ aagl.nixosModules.default ];

              nix.settings = aagl.nixConfig;

              programs.anime-game-launcher.enable = false;
              programs.anime-games-launcher.enable = false;
              programs.honkers-railway-launcher.enable = true;
              programs.honkers-launcher.enable = false;
              programs.wavey-launcher.enable = false;
              programs.sleepy-launcher.enable = false;
            }

            autofirma-nix.nixosModules.default

            ({ config, pkgs, ... }: {
              # The autofirma command becomes available system-wide
              programs.autofirma = {
                enable = true;
                firefoxIntegration.enable = true;
              };

              # DNIeRemote integration for using phone as NFC reader
              programs.dnieremote = {
                enable = true;
              };

              # The FNMT certificate configurator
              programs.configuradorfnmt = {
                enable = true;
                firefoxIntegration.enable = true;
              };

              # Firefox configured to work with AutoFirma
              programs.firefox = {
                enable = true;
                policies.SecurityDevices = {
                  "OpenSC PKCS#11" = "${pkgs.opensc}/lib/opensc-pkcs11.so";
                  "DNIeRemote" = "${config.programs.dnieremote.finalPackage}/lib/libdnieremotepkcs11.so";
                };
              };

              # Enable PC/SC smart card service
              services.pcscd.enable = true;
            })
          ];
        };
      };

    };
}
