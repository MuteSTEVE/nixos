{ config, pkgs, ... }:

{
	programs.kitty.enable = true;
	programs.rofi.enable = true;

	home.packages = with pkgs; [
		swww
		hyprpaper
	];
}
