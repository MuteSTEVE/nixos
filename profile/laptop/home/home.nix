{ config, pkgs, hostvars, ... }:

{
	imports = [
		./hyprland/hyprland.nix
		./modules/fonts.nix
		./modules/home-packages.nix
		./modules/gitconfig.nix
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
