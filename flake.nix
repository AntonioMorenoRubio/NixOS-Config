{
  description = "Mi Configuración de NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    #nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    #Other inputs
    aagl.url = "github:ezKEa/aagl-gtk-on-nix/release-25.05";
    aagl.inputs.nixpkgs.follows = "nixpkgs"; # Name of nixpkgs input you want to use
  };

  outputs = { self, nixpkgs, aagl }:
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
          ];
        };
      };

    };
}
