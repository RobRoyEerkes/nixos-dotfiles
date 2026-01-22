{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ./noctalia-shell.nix
  ];

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
