{ config, pkgs, hostvars, ... }:

{
	imports = [
		./modules/init.nix
		./hyprland/hyprland.nix
		./kitty/kitty.nix
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
