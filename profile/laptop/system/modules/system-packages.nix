{ config, lib, pkgs, ... }:

{
	programs.firefox.enable = true;
	programs.hyprland.enable = true;

	environment.systemPackages = with pkgs; [
		git
		hyprpaper
		kitty
		neovim
		wget
	];
}
