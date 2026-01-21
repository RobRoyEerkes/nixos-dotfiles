{
  pkgs,
  config,
  lib,
  ...
}:

{

  home.packages = with pkgs; [
    niri
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
