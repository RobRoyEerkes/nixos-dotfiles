{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.cargo
    pkgs.rustc
    pkgs.rustfmt
    pkgs.gcc
    pkgs.cmake
    pkgs.uv
  ];

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
