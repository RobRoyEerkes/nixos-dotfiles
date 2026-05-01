{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/default.nix
    ../../modules/openrgb.nix
  ];
  services.udev.packages = [ pkgs.qlcplus ];
  environment.systemPackages = with pkgs; [
    qlcplus
  ];

  system.stateVersion = "25.11";
}
