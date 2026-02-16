{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    thunar
    ristretto
    tumbler
    gimp
  ];
  services.gvfs.enable = true;
  programs.xfconf.enable = true;
  programs.dconf.enable = true;
}
