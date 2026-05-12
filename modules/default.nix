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
    ./bootloader.nix
    ./updates.nix
    ./nvim
    inputs.home-manager.nixosModules.home-manager
    inputs.niri.nixosModules.niri
  ];

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  nixpkgs.config.allowUnfree = true;

  home-manager.extraSpecialArgs = {
    inherit inputs;
    inherit hostname;
  };

  home-manager.users.rob.imports = [ ./home.nix ];
  home-manager.backupFileExtension = "backup";
  home-manager.useGlobalPkgs = true;

  networking.hostName = hostname; # Define your hostname.

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Amsterdam";

  services.displayManager.ly.enable = true;

  services.xserver.xkb.options = "caps:escape";

  services.printing.enable = true;

  services.dbus.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  security.pam.loginLimits = [
    {
      domain = "@audio";
      item = "memlock";
      type = "-";
      value = "unlimited";
    }
    {
      domain = "@audio";
      item = "rtprio";
      type = "-";
      value = "99";
    }
    {
      domain = "@audio";
      item = "nofile";
      type = "soft";
      value = "99999";
    }
    {
      domain = "@audio";
      item = "nofile";
      type = "hard";
      value = "99999";
    }
  ];

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
      "dialout"
    ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  services.udisks2.enable = true;
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    config.common.default = "*";
  };

  programs.niri = {
    enable = true;

    package = pkgs.niri-stable;
  };

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    bash
    wget
    git
    ripgrep
    bat
    fd
    tldr
    btop
    unzip
    eza
    jq
    fastfetch
    inputs.zen.packages."${stdenv.hostPlatform.system}".default
    # brave
    uv
    networkmanagerapplet # NOTE: for configuring eduroam
    # TODO: Add eduroam to the system automaticly
    wl-clipboard
    pciutils
    lshw
    discord
    brightnessctl # NOTE: Don't know if this is needed need to test on laptop
    libnotify
    eduvpn-client
    texlive.combined.scheme-medium
    python314Packages.pylatexenc
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix = {
    # NOTE: removes orphaned system files and keeps the disk clean
    # NOTE: If you want to automaticly remove devshells see this in home manager
    gc = {
      automatic = true; # Enable the automatic garbage collector
      persistent = true;
      dates = "Mon, 03:15"; # When to run the garbage collector
      options = ""; # Arguments to pass to nix-collect-garbage
    };

    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
