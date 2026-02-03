{ config, pkgs, ... }:

{
	programs.rofi.enable = true;
	home.packages = with pkgs; [
		swww
		hyprpaper
		pywal16
	];
}
