{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xfce.thunar
    xfce.ristretto
    xfce.tumbler
    gimp
  ];
  services.gvfs.enable = true;
  programs.xfconf.enable = true;
  programs.dconf.enable = true;
}
