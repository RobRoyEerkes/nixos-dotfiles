{ pkgs, ... }:
{
  systemd.user = {
    services.update-notifier = {
      description = "Checks for nixos-updates";
      serviceConfig = {
        Type = "oneshot";
        ExecStart = pkgs.writeShellScript "updates" ''
          ${builtins.readFile ./scripts/updates}
        '';
        Environment = "PATH=${
          pkgs.lib.makeBinPath [
            pkgs.nix
            pkgs.jq
            pkgs.libnotify
            pkgs.coreutils
          ]
        }";
      };
    };

    timers.update-notifier = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = "5m";
        OnUnitActiveSec = "1h";
        Unit = "update-notifier.service";
      };
    };
  };

}
