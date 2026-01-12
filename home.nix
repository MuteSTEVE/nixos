{ config, pkgs, ... }:

{
	home.username = "mutesteve";
	home.homeDirectory = "/home/mutesteve";
	home.stateVersion = "25.11";

	home.packages = with pkgs; [
		anki
		bluetui
		bluez
		btop
		fastfetch
		git
		hyprpaper
		kitty
		neovim
		vim
		waybar
		wget
	];

	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo I use Nixos btw";
		};
	};
}
