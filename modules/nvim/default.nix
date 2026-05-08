{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nixvim.nixosModules.nixvim
    ./programming.nix
  ];

  programs.nixvim = {
    enable = true;

    opts = {
      number = true;
      relativenumber = true;

      tabstop = 2;
      shiftwidth = 2;
      smarttab = true;

      scrolloff = 8;
    };

    clipboard = {
      providers.wl-copy = {
        enable = true;
        package = pkgs.wl-clipboard;
      };
      register = "unnamedplus";
    };

    colorschemes.tokyonight.enable = true;

    plugins = {

      # lsp configuration

      lsp-format.enable = true;
      lsp = {
        enable = true;
        servers = {
          "*".config.root_markers = [ ".git" ];
          nil_ls = {
            enable = true;
            config = {
              root_markers = [ "flake.nix" ];
              autoArchive = true;
              autoEvalInputs = true;
            };
          };
          # TODO: switch to nixd with right colorscheme
          #          nixd = {
          #            enable = true;
          #j            config = {
          #              root_markers = [ "flake.nix" ];
          #							capabilities.textDocument.semanticTokens = false;
          #            };
          #          };
          bashls.enable = true;
        };
      };

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          completion.completeopt = "menu,menuone,noinsert";
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
            { name = "luasnip"; }
          ];
          mapping = {
            "<Tab>" = "cmp.mapping.confirm({ select = true})";
            "<Down>" = "cmp.mapping.select_next_item()";
            "<Up>" = "cmp.mapping.select_prev_item()";
          };

        };
      };

      dashboard = {
        enable = true;
        settings = {
          change_to_vcs_root = true;
          config = {
            footer = [
              "Made with ❤️"
            ];
            header = [
              "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
              "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
              "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
              "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
              "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
              "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
            ];
            mru = {
              limit = 20;
            };
            project = {
              enable = false;
            };
            shortcut = [
              {
                action = {
                  __raw = "function(path) vim.cmd('lua Snacks.picker.files({cwd = path})') end";
                };
                desc = "Files";
                group = "Label";
                icon = " ";
                icon_hl = "@variable";
                key = "f";
              }

              {
                action = "lua Snacks.picker.files({cwd = vim.fn.expand('~/nixos-dotfiles')})";
                desc = " dotfiles";
                group = "Number";
                key = "d";
              }
            ];
            week_header = {
              enable = true;
            };
          };
          theme = "hyper";
        };
      };

      oil = {
        enable = true;
        settings = {
          skip_confirm_for_simple_edits = true;
          win_options = {
            wrap = true;
            signcolumn = "yes:2";
          };
          float = {
            padding = 5;
          };
          view_options = {
            show_hidden = true;
            # is_always_hidden =
            # helpers.mkRaw # lua
            # ''
            # function(name,_)
            # return name == ".." or name == ".git"
            # end
            # '';
          };
          keymaps = {
            "<BS>" = "actions.parent";
            "<CR>" = "actions.select";
            "gp" = "actions.preview";
            "q" = "actions.close";
            "<c-CR>" = "actions.open_cwd";
          };
        };
      };

      snacks = {
        enable = true;
        autoload = true;
        picker = {
          enable = true;
        };
      };

      bufferline.enable = true;
      lualine.enable = true;
      nvim-autopairs.enable = true;
      web-devicons.enable = true;
      which-key.enable = true;
      mini-icons.enable = true;
      colorizer.enable = true;
      mini-comment = {
        enable = true;
        settings.mappings = {
          comment_line = "<c-/>";
          comment_visual = "<c-/>";
        };
      };
    };

    keymaps = [
      {
        key = "<leader>e";
        mode = "n";
        action = "<CMD>Oil<CR>";
        options.desc = "Oil";
      }
      {
        key = "<leader><space>";
        mode = "n";
        action = "<CMD>lua Snacks.picker.smart()<CR>";
        options.desc = "Picker";
      }
      {
        key = "<leader>ff";
        mode = "n";
        action = "<CMD>lua Snacks.picker.files()<CR>";
        options.desc = "Search files";
      }
      {
        key = "<leader>fc";
        mode = "n";
        action = "<CMD>lua Snacks.picker.files({cwd = vim.fn.expand('~/nixos-dotfiles')})<CR>";
        options.desc = "Search config files";
      }
    ];

    globals = {
      mapleader = " ";
    };
  };
}
