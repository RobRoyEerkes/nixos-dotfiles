{ hostname, ... }:
{

  programs.bash = {
    enable = true;
    shellAliases = {
      nixos-switch = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#${hostname}";
      nixos-test = "sudo nixos-rebuild test --flake ~/nixos-dotfiles#${hostname}";
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
    };
  };
}
