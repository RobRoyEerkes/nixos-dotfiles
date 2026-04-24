{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader = {
    efi.canTouchEfiVariables = true;
    limine = {
      enable = true;
      secureBoot = {
        enable = false;
        autoGenerateKeys = true;
      };

      maxGenerations = 10;
      extraConfig = ''
        				
        			'';

    };
  };
  environment.systemPackages = with pkgs; [
    sbctl
  ];
}
