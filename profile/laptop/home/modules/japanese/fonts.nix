{ config, pkgs, lib, ... }:

{
	home.packages = with pkgs; [
		noto-fonts
		noto-fonts-cjk-sans
		noto-fonts-cjk-serif
		noto-fonts-color-emoji
		nerd-fonts.hack
		ipafont
	];

	fonts.fontconfig = {
		enable = true;
		defaultFonts = {
			monospace = [
				"Hack Nerd Font"
				"Noto Sans Mono CJK JP"
			];

			sansSerif = [
				"Noto Sans"
				"Noto Sans CJK JP"
			];

			serif = [
				"Noto Serif"
				"Noto Serif CJK JP"
			];
		};
	};
}
