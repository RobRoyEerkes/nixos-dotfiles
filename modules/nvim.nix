# vim: fixeol eol expandtab tabstop=2 shiftwidth=2
{
  pkgs,
  config,
  ...
}:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;

    extraPackages = with pkgs; [
      # language servers for nvim
      # TODO: migrate to nixvim
      jdk
      git
      gcc
      gopls
      nil
      pyright
      eslint
      eslint_d
      tree-sitter
      typescript-language-server
      clang-tools
      go
      libxml2
      shfmt
      jq
      stylua
      yamlfmt
      shellcheck
      black
      python313Packages.cssbeautifier
      lua-language-server
      bash-language-server
      vscode-langservers-extracted
      ltex-ls-plus
      cmake
      cmake-language-server
      perlPackages.PerlTidy
      html-tidy
      python3
      nixfmt-classic
      nixpkgs-fmt
    ];
  };
  home.sessionVariables = {
    MANPAGER = "nvim +Man!";
  };
  home.file."./.config/nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-dotfiles/config/nvim";
}
