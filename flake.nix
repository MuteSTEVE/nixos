{
	description = "Dr.MuteSTEVE NixOS Flake + Home-manager";
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		omarchy-nix = {
			url = "github:henrysipp/omarchy-nix";
			inputs.nixpkgs.follows = "nixpkgs";
			inputs.home-manager.follows = "home-manager";
		};
	};

	outputs = { nixpkgs, omarchy-nix, home-manager, ... }: {
		nixosConfigurations.hendarto = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./configuration.nix
				omarchy-nix.nixosModules.default
				home-manager.nixosModules.home-manager
				{
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.mutesteve = import ./home.nix;
						backupFileExtension = "backup";
					};


					# Configure omarchy
					omarchy = {
						full_name = "mutesteve";
						email_address = "Dr.MuteSTEVE2@protonmail.com";
						theme = "tokyo-night";
					};
				}
			];
		};
	};
}
