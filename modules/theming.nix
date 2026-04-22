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

  programs.fuzzel.enable = true;
  programs.kitty.enable = true;
  services.mako.enable = true;
  programs.alacritty.enable = true;
  programs.swaylock.enable = false;
  services.swayidle.enable = false;
  programs.niri = {
    settings = {
      hotkey-overlay.skip-at-startup = true;
      prefer-no-csd = true;
    };
  };

}
