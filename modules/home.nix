{ pkgs, ... }:
{
  imports = [
    ./theming.nix
    ./media.nix
    ./bash.nix
    ./fastfetch.nix
    ./niri.nix
  ];
  home.username = "rob";
  home.homeDirectory = "/home/rob";
  programs.git.enable = true;
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
  programs.git = {
    settings = {
      user = {
        name = "Rob Eerkes";
        email = "rreerkes@hotmail.com";
      };
      init.defaultBranch = "master";
      push.autoSetupRemote = true;
      advice.addEmptyPathspec = false;

    };

  };
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
  services.udiskie = {
    enable = true;
    settings = {
      # workaround for
      # https://github.com/nix-community/home-manager/issues/632
      program_options = {
        # replace with your favorite file manager
        file_manager = "${pkgs.thunar}/bin/thunar";
      };
    };
  };
  programs.zathura = {
    enable = true;
    options = {
      recolor = true; # Enables recoloring by default
      recolor-keephue = true; # Keeps colors in images/diagrams from looking like a negative

      # Tokyo Night / Dark Palette
      default-bg = "#1a1b26";
      default-fg = "#c0caf5";
      recolor-lightcolor = "#1a1b26";
      recolor-darkcolor = "#c0caf5";
    };
  };

  home.packages = with pkgs; [
    xwayland-satellite
  ];
}
