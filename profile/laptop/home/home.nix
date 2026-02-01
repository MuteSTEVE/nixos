{ config, pkgs, hostvars, ... }:

{
	imports = [
		./modules/init.nix
		./programs/init.nix
	];

	home = {
		username = hostvars.username;
		homeDirectory = "/home/${hostvars.username}";
		stateVersion = hostvars.stateVersion;
	};

	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo I use Nixos btw";
		};
	};
}
