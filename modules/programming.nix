{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.cargo
    pkgs.gcc
    pkgs.cmake
    pkgs.uv
  ];

  programs.nixvim.settings.plugins.lsp.servers = {
    rust-analyzer = true;
    clangd = true;
    cmake = true;
    pylsp = true;
  };

}
