{
  config,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/default.nix
  ];
  services.xserver.videoDrivers = [
    "nvidia"
  ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };

    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    open = false;
  };
  system.stateVersion = "25.11";
}
