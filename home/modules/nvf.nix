{ pkgs, ... }:

{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        globals = {
          mapleader = " ";
        };

        statusline.lualine.enable = true;

        autocomplete.nvim-cmp.enable = true;

        binds = {
          whichKey = {
            enable = true;
          };
        };

        lazy = {
          enable = true;
          plugins = {

          };
        };

        theme = {
          enable = true;
          name = "everforest";
          style = "hard";
        };

        telescope = {
          enable = true;
          extensions = [
            {
              name = "fzf";
              packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
              setup = {fzf = {fuzzy = true;};};
            }
          ];
        };

        lsp = {
          enable = true;
          formatOnSave = true;
          inlayHints.enable = true;
          lightbulb.enable = true;
          trouble.enable = true;
        };
      };
    };
  };
}
