{ config, pkgs, ... }:

{
  home.username = "rob";
  home.homeDirectory = "/home/rob";
  programs.git.enable = true;
  home.stateVersion = "25.11";
  programs.bash = {
    enable = true;
  };

  programs.git = {
    settings = {
      user = {
        name = "Rob Eerkes";
	email = "rreerkes@hotmail.com";
      };
      init.defaultBranch = "master";
};
};
  
  programs.neovim = {
	package = pkgs.callPackage ./config/nvim {};
  };
  home.packages = with pkgs; [
    neovim
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc

  ];


}
