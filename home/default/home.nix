{ config, pkgs, hostvars, ... }:

{
	home.username = hostvars.username;
	home.homeDirectory = "/home/${hostvars.username}";
	home.stateVersion = hostvars.stateVersion;

	home.packages = with pkgs; [
		anki
		bluetui
		btop
		fastfetch
		impala
		lazygit
		tree
	];

	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo I use Nixos btw";
		};
	};

	imports = [
		./hyprland/hyprland.nix
	];
}
