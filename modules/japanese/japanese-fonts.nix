{ config, pkgs, lib, ... }:

{
	home.packages = with pkgs; [
		noto-fonts-cjk-sans
		noto-fonts-cjk-serif
		ipafont
	];

	fonts.fontconfig = {
		enable = true;
		defaultFonts = {
			monospace = [
				"Noto Sans Mono CJK JP"
			];

			sansSerif = [
				"Noto Sans CJK JP"
			];

			serif = [
				"Noto Serif CJK JP"
			];
		};
	};
}
