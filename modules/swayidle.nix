{ pkgs, ... }:
{
  services.swayidle =
    let
      lock = "${pkgs.swaylock-effects}/bin/swaylock --daemonize";
      display = status: "${pkgs.niri}/bin/niri msg action power-${status}-monitors";
    in
    {
      enable = true;
      timeouts = [
        {
          timeout = 175;
          command = "${pkgs.libnotify}/bin/notify-send 'Locking in 5 seconds' -t 5000";
        }
        {
          timeout = 180;
          command = lock;
        }
        {
          timeout = 185;
          command = display "off";
          resumeCommand = display "on";
        }

      ];
      events = {
        "before-sleep" = (display "off") + ";" + lock; # TODO: also turn of case lights (openrgb)
        "after-resume" = display "on";

      };
    };
}
