{ ... }:
{
  systemd.user.services.update-notifier = {
    enable = true;
    description = "Checks for nixos-updates";
    serviceConfig = {

    };
  };
}
