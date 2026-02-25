{ hostname, ... }:
{

  programs.bash = {
    enable = true;
    shellAliases = {
      nixos-switch = "sudo nixos-rebuild switch -p test --flake ~/nixos-dotfiles#${hostname}";
      nixos-switch-stable = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#${hostname}";
      nixos-test = "sudo nixos-rebuild test --flake ~/nixos-dotfiles#${hostname}";
      nixos-upgrade = "nix flake update --flake ~/nixos-dotfiles && sudo nixos-rebuild switch --upgrade --flake ~/nixos-dotfiles#${hostname}";

      ls = "eza";
      cat = "bat";
      cd = "z";
    };
    initExtra = "fastfetch";
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
    };
  };
}
