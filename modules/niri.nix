{
  pkgs,
  config,
  lib,
  ...
}:

{
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
