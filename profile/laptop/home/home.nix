{ config, pkgs, hostvars, ... }:

{
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

	imports = [
		./modules/hyprland/hyprland.nix
		./modules/fonts.nix
		./modules/home-packages.nix
		./modules/gitconfig.nix
	];
}
