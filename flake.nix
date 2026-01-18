{
	description = "Dr.MuteSTEVE NixOS Flake + Home-manager";
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager }:

	let
		username = "mutesteve";
		hostname = "hendarto";
		timezone = "Asia/Jakarta";

		stateVersion = "25.11";
		system = "x86_64-linux";
	in

	{
		nixosConfigurations = {
			## TODO: Add more configuration for vm, desktop and laptop
			default = nixpkgs.lib.nixosSystem {
				specialArgs = { inherit username hostname stateVersion system timezone; };
				modules = [
					./hosts/default/configuration.nix
					home-manager.nixosModules.home-manager {
						home-manager = {
							useGlobalPkgs = true;
							useUserPackages = true;
							users.${username} = import ./home/default/home.nix;
							extraSpecialArgs = { inherit username hostname stateVersion system; };
							backupFileExtension = "backup";
						};
					}

				];
			};
		};
	};
}
