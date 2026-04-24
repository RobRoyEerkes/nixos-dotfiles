{
  description = "NixOS from scratch";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:nix-community/nixvim";

    zen = {
      url = "github:youwen5/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    niri.url = "github:sodiboo/niri-flake";

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-substituters = [
      "https://noctalia.cachix.org"
      "https://niri.cachix.org"
    ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
    ];
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixvim,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        nixos-rob = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/desktop/configuration.nix
          ];
          specialArgs = {
            inherit inputs;
            hostname = "nixos-rob";

          };
        };
        nixos-laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/laptop/configuration.nix
          ];
          specialArgs = {
            inherit inputs;
            hostname = "nixos-laptop";
          };
        };
      };
    };
}
