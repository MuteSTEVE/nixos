{ config, lib, pkgs, ... }:

{
	programs.firefox.enable = true;
	programs.hyprland.enable = true;

	environment.systemPackages = with pkgs; [
		ffmpeg-full
	];
}
