{
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/default.nix
  ];
  system.stateVersion = "25.11";
}
