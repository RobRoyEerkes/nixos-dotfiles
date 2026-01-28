{ pkgs, ... }:
{
  home.packages = with pkgs; [
    spotify # NOTE: I want to deprecate this.
    rmpc
    vlc
  ];
  services.mpd = {
    enable = true;
    musicDirectory = "~/Music";
  };
}
