{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xfce.thunar
    xfce.ristretto
    gimp
  ];
}
