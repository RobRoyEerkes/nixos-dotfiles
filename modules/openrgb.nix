{ pkgs, ... }:
{
  hardware.i2c.enable = true;
  services.hardware.openrgb = {
    package = pkgs.openrgb.overrideAttrs (old: {
      src = pkgs.fetchFromGitLab {
        owner = "CalcProgrammer1";
        repo = "OpenRGB";
        rev = "master";
        sha256 = "sha256-/a6+UQPkdVACoIyexMHENsAPA7xxLmx/qhohGFB2MFw=";
      };
      patches = [ ];
      version = "experimental";
    });
    enable = true;
    startupProfile = null; # TODO: set this to my old one with blue and pink
  };

}
