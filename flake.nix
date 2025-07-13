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
            (import ./modules/aagl.nix { inherit aagl; })

            autofirma-nix.nixosModules.default
            ./modules/autofirma.nix
          ];
        };
      };

    };
}
