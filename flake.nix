{
  description = "NixOS from scratch";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";

    };
    nixvim.url = "github:RobRoyEerkes/nixvim-config";
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms.url = "github:AvengeMedia/DankMaterialShell";
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixvim,
      dms,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        nixos-rob = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/configuration.nix
          ];
          specialArgs = { inherit inputs; };
        };
        nixos-laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/laptop/configuration.nix
          ];
          specialArgs = { inherit inputs; };
        };
      };
    };
}
