{ config, pkgs, ... }:

{
	imports = [
		./modules/bluetooth.nix
		./modules/fcitx5.nix
		./config/git/git-config.nix
		./config/hyprland/hyprland.nix
	];

	home.username = "mutesteve";
	home.homeDirectory = "/home/mutesteve";
	home.stateVersion = "25.11";

	home.packages = with pkgs; [
		anki
		bluetui
		bluez
		btop
		fastfetch
		impala
		lazygit
	];

	programs.firefox.enable = true;

	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo I use Nixos btw";
		};
	};
}
