{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xfce.thunar
    xfce.ristretto
    xfce.tumbler
    gimp
  ];
}
