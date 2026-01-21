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
