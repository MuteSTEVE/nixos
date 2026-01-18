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
		hostvars = import ./config/host-user-info.nix;

		username = hostvars.username;
		hostname = hostvars.hostname;
		timezone = hostvars.timezone;

		stateVersion = hostvars.stateVersion;
		system = hostvars.system;
	in

	{
		nixosConfigurations = {
			## TODO: Add more profile for desktop and virtual-machine
			laptop = nixpkgs.lib.nixosSystem {
				specialArgs = { inherit hostvars username hostname stateVersion system timezone; };
				modules = [
					./profile/laptop/system/configuration.nix
					home-manager.nixosModules.home-manager {
						home-manager = {
							useGlobalPkgs = true;
							useUserPackages = true;
							users.${username} = import ./profile/laptop/home/home.nix;
							extraSpecialArgs = { inherit hostvars username hostname stateVersion system; };
							backupFileExtension = "backup";
						};
					}
				];
			};
		};
	};
}
