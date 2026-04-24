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

  # NOTE: removes orphaned system files and keeps the disk clean
  # NOTE: If you want to automaticly remove devshells see this in home manager
  nix.gc = {
    automatic = true; # Enable the automatic garbage collector
    persistent = true;
    dates = "Mon, 03:15"; # When to run the garbage collector
    options = ""; # Arguments to pass to nix-collect-garbage
  };

  environment.systemPackages = with pkgs; [
    sbctl
  ];
}
