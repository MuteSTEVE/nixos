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
		hostvars = import ./user-info.nix;

		username = hostvars.username;
		hostname = hostvars.hostname;
		timezone = hostvars.timezone;

		stateVersion = hostvars.stateVersion;
		system = hostvars.system;
	in

	{
		nixosConfigurations = {
			## TODO: Add more profile for desktop & virtual-machine (server if needed)
			laptop = nixpkgs.lib.nixosSystem {
				specialArgs = { inherit hostvars username hostname stateVersion system timezone; };
				modules = [
					./hosts/laptop/configuration.nix
					home-manager.nixosModules.home-manager {
						home-manager = {
							useGlobalPkgs = true;
							useUserPackages = true;
							users.${username} = import ./hosts/laptop/home.nix;
							extraSpecialArgs = { inherit hostvars username hostname stateVersion system; };
							backupFileExtension = "backup";
						};
					}
				];
			};
		};
	};
}
