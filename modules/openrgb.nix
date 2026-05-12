{ pkgs, ... }:
{
  hardware.i2c.enable = true;
  services.hardware.openrgb = {
    package = pkgs.openrgb.overrideAttrs (old: {
      # TODO: make this a commit not the master branch for less frequent updates
      src = pkgs.fetchFromGitLab {
        owner = "CalcProgrammer1";
        repo = "OpenRGB";
        rev = "master";
        sha256 = "sha256-1Tnw45J9Hm9Va9KQpcFUMS8UCQrJNIc3KeKYvDVch/4=";
      };
      patches = [ ];
      version = "experimental";
    });
    enable = true;
    startupProfile = null; # TODO: set this to my old one with blue and hotpink
  };

}
