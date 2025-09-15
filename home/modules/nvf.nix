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
      };
    };
  };
}
