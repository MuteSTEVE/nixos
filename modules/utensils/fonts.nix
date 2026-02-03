{ config, pkgs, lib, ... }:

{
	home.packages = with pkgs; [
		noto-fonts
		noto-fonts-color-emoji
		nerd-fonts.hack
		nerd-fonts.jetbrains-mono
	];

	fonts.fontconfig = {
		enable = true;
		defaultFonts = {
			monospace = [
				"Hack Nerd Font"
			];

			sansSerif = [
				"Noto Sans"
			];

			serif = [
				"Noto Serif"
			];
		};
	};
}
