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
          timeout = 295;
          command = "${pkgs.libnotify}/bin/notify-send -u low 'Locking in 5 seconds' -t 5000";
        }
        {
          timeout = 300;
          command = lock;
        }
        {
          timeout = 315;
          command = display "off";
          resumeCommand = display "on";
        }

        {
          timeout = 600;
          command = "systemctl suspend";
        }
      ];
      events = {
        "before-sleep" = (display "off") + ";" + lock; # TODO: also turn of case lights (openrgb)
        "after-resume" = display "on";

      };
    };
}
