{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.cargo
    pkgs.rustc
    pkgs.rustfmt
    pkgs.gcc
    pkgs.cmake
    pkgs.uv
    pkgs.typst
  ];

  # programs.nixvim.plugins.treesitter = {
  #   enable = true;
  #
  #   # This tells Nix to include these specific parsers in the build
  #   grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
  #     markdown
  #     markdown_inline
  #     html
  #     latex
  #     yaml
  #     typst # Highly recommended for your tinymist setup
  #     bash
  #     python
  #     rust
  #   ];
  #
  #   settings = {
  #     highlight.enable = true;
  #     indent.enable = true;
  #   };
  # };
  programs.nixvim = {
    diagnostic.settings = {
      virtual_text = true;
    };

    lsp = {

      inlayHints.enable = true;
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
        rust_analyzer = {
          enable = true;
          config = {
            installCargo = false;
            installRustc = false;
          };
        };
        clangd.enable = true;
        cmake.enable = true;
        pylsp.enable = true;
        tinymist = {
          enable = true;
          config.exportPdf = "onSave";
        };
        html.enable = true;
        latex.enable = true;

        # TODO: switch to nixd with right colorscheme
        #          nixd = {
        #            enable = true;
        #            config = {
        #              root_markers = [ "flake.nix" ];
        #							capabilities.textDocument.semanticTokens = false;
        #            };
        #          };
        bashls.enable = true;
      };

      autoArchive.enable = true;
      keymaps = [
        {
          key = "gd";
          lspBufAction = "definition";
        }
        {
          key = "gD";
          lspBufAction = "references";
        }
        {
          key = "gt";
          lspBufAction = "type_definition";
        }
        {
          key = "gi";
          lspBufAction = "implementation";
        }
        {
          key = "K";
          lspBufAction = "hover";
        }
        # {
        #   action = lib.nixvim.mkRaw "function() vim.diagnostic.jump({ count=-1, float=true }) end";
        #   key = "<leader>k";
        # }
        # {
        #   action = lib.nixvim.mkRaw "function() vim.diagnostic.jump({ count=1, float=true }) end";
        #   key = "<leader>j";
        # }
        {
          action = "<CMD>LspStop<Enter>";
          key = "<leader>lx";
        }
        {
          action = "<CMD>LspStart<Enter>";
          key = "<leader>ls";
        }
        {
          action = "<CMD>LspRestart<Enter>";
          key = "<leader>lr";
        }
        # {
        #   action = lib.nixvim.mkRaw "require('telescope.builtin').lsp_definitions";
        #   key = "gd";
        # }
        {
          action = "<CMD>Lspsaga hover_doc<Enter>";
          key = "K";
        }
      ];
    };
    plugins = {
      lsp-format = {
        enable = true;
        lspServersToEnable = "all";
      };
      lspconfig.enable = true;
    };

  };

}
