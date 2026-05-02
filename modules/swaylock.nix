{ pkgs, ... }:
{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;

    settings = {
      ignore-empty-password = true;
      grace = 5;

      screenshots = true;
      effect-blur = "15x10";
      clock = true;
      timestr = "%H:%M";
      datestr = "%d-%m-%Y";
      indicator = true;
      indicator-radius = 100;
      indicator-thickness = 7;
      ring-color = "9d7cd8"; # #9d7cd8
      key-hl-color = "f7768e"; # #f7768e
      line-color = "00000000";
      inside-color = "00000088";
      separator-color = "00000000";
      fade-in = 0.2;

    };
  };
}
