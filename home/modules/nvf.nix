{
  lib,
  pkgs,
  ...
}: {
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
          lspkind.enable = true;
          trouble.enable = true;
        };

        languages = {
          enableFormat = true;

          css = {
            enable = true;
            format.type = "prettierd";
          };
          csharp.enable = true;
          java.enable = true;
          lua.enable = true;
          markdown.enable = true;
          nix.enable = true;
          python.enable = true;
          sql.enable = true;
          ts = {
            enable = true;
            format = {
              enable = true;
              type = "prettierd";
            };
            lsp = {
              enable = true;
              server = "ts_ls";
            };
          };
        };

        extraPackages = with pkgs; [
          nodePackages.prettier
          prettierd
        ];

        diagnostics = {
          enable = true;
          config = {
            virtual_text = {
              enabled = true;
              source = "if_many";
              spacing = 4;
              prefix = "●";
              # Configuración para mostrar múltiples errores
              severity = {
                min = "HINT"; # Mostrar todos los niveles
              };
              # Formato personalizado para los mensajes
              format = lib.generators.mkLuaInline ''
                function(diagnostic)
                  return string.format("%s (%s)", diagnostic.message, diagnostic.source)
                end
              '';
            };
            signs = {
              text = {
                ERROR = "";
                WARN = "";
                INFO = "";
                HINT = "";
              };
            };
            underline = true;
            update_in_insert = false;
            severity_sort = true;
            float = {
              focusable = false;
              style = "minimal";
              border = "rounded";
              source = "always";
              header = "";
              prefix = "";
            };
            virtual_lines.enable = true;
          };
        };
      };
    };
  };
}
