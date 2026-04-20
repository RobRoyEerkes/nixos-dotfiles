{ inputs, pkgs, ... }:
{
  imports = [ inputs.nixvim.nixosModules.nixvim ];

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
          nil_ls.enable = true;
          bashls.enable = true;
          clangd.enable = true;
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
            "<s-CR>" = "actions.parent";
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
      mini.icons.enable = true;
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
