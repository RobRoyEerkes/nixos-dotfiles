{ pkgs, ... }:
{
  imports = [
    ./niri.nix
    ./nvim.nix
    ./media.nix
  ];
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
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  home.packages = with pkgs; [
  ];
}
