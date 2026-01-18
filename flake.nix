{
	description = "NixOS from scratch";
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-25.11";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";

		};
		nvf.url = "github:notashelf/nvf";

	};
	outputs = { self, nixpkgs, home-manager, nvf, ... }: {
		nixosConfigurations.nixos-rob = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				nvf.nixosModules.default
				./configuration.nix
				home-manager.nixosModules.home-manager 
				{
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.rob = import ./home.nix;
						backupFileExtension = "backup";
					};
				}
				
			];
		};
	};
}
