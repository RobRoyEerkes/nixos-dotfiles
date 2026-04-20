{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ristretto
    tumbler
    gimp
    file-roller
  ];

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
    ];
  };

  services.gvfs.enable = true;
  programs.xfconf.enable = true;
  programs.dconf.enable = true;
}
