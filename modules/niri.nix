{
  pkgs,
  config,
  ...
}:

{
  imports = [
    ./noctalia-shell.nix
  ];
  gtk = {
    enable = true;

    theme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyonight-gtk-theme;
    };

    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    gtk3.extraConfig = {
      "gtk-application-prefer-dark-theme" = 1;
    };

    gtk4.theme = config.gtk.theme;
    gtk4.extraConfig = {
      "gtk-application-prefer-dark-theme" = 1;
    };
  };
  dconf.enable = true; # TODO: Check if this is needed
  home.pointerCursor = {
    enable = true;
    name = "BreezeX-RosePine-Linux";
    package = pkgs.rose-pine-cursor;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  home.sessionVariables = {
    XCURSOR_THEME = "BreezeX-RosePine-Linux";
    XCURSOR_SIZE = "24";
  };

  home.packages = with pkgs; [
    alacritty # move to kitty or ghostty for image support
    fuzzel
    swaylock
    swayidle # still need to set this up
    mako
    xdg-desktop-portal-gnome

  ];
  xdg.configFile = {
    niri.source = ../config/niri; # TODO: Switch to the flake version to write this in nix-lang
  };
}
