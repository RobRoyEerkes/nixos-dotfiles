{
  pkgs,
  inputs,
  hostname,
  ...
}:
{
  imports = [
    ./games.nix
    ./filehandling.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  nixpkgs.config.allowUnfree = true;
  home-manager.extraSpecialArgs = {
    inherit inputs;
    inherit hostname;
  };

  home-manager.users.rob.imports = [ ./home.nix ];
  home-manager.backupFileExtension = "backup";
  home-manager.useGlobalPkgs = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = hostname; # Define your hostname.

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Amsterdam";

  services.displayManager.ly.enable = true;

  services.xserver.xkb.options = "caps:escape";

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        # Shows battery charge of connected devices on supported
        # Bluetooth adapters. Defaults to 'false'.
        Experimental = true;
        # When enabled other devices can connect faster to us, however
        # the tradeoff is increased power consumption. Defaults to
        # 'false'.
        FastConnectable = true;
      };
      Policy = {
        # Enable all controllers when they are found. This includes
        # adapters present on start as well as adapters that are plugged
        # in later on. Defaults to 'true'.
        AutoEnable = true;
      };
    };
  };

  programs.nix-ld.enable = true;
  users.users.rob = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };
  services.udisks2.enable = true;
  programs.niri = {
    enable = true;
  };
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.swaylock = { };

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    bash
    wget
    git
    ripgrep
    zoxide
    bat
    fd
    tldr
    btop
    eza
    fastfetch
    brave
    uv
    networkmanagerapplet # NOTE: for configuring eduroam
    # TODO: Add eduroam to the system automaticly
    inputs.nixvim.packages.${system}.default
    wl-clipboard
    pciutils
    lshw
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
