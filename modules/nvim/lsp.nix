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

  programs.nixvim.plugins.treesitter = {
    enable = true;

    # This tells Nix to include these specific parsers in the build
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      markdown
      markdown_inline
      html
      latex
      yaml
      typst # Highly recommended for your tinymist setup
      bash
      python
      rust
    ];

    settings = {
      highlight.enable = true;
      indent.enable = true;
    };
  };

  programs.nixvim.plugins.lsp = {
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
      rust_analyzer = {
        enable = true;
        installCargo = false;
        installRustc = false;
      };
      clangd.enable = true;
      cmake.enable = true;
      pylsp.enable = true;
      tinymist = {
        enable = true;
        settings.exportPdf = "onSave";
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
  };

}
