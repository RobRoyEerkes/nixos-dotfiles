{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:

{
  imports = [
    inputs.noctalia.homeModules.default
    ./noctalia-shell.nix
  ];
  programs.noctalia-shell = {
    enable = true;
    settings = {

    };
  };
  home.packages = with pkgs; [
    alacritty
    fuzzel
    swaylock
    swayidle
    mako

  ];
  xdg.configFile = {
    niri.source = ../config/niri;
  };
}
