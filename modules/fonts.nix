{ config, lib, pkgs, ... }:

{
    # Fuentes NerdFonts
    fonts.packages = builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}
