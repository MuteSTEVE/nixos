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

	i18n.inputMethod = {
		enable = true;
		type = "fcitx5";
		fcitx5 = {
			waylandFrontend = true;
			addons = with pkgs; [
				fcitx5
				fcitx5-mozc
				qt6Packages.fcitx5-configtool
			];

			settings.inputMethod = {
				GroupOrder."0" = "Default";
				"Groups/0" = {
					Name = "Default";
					"Default Layout" = "us";
					DefaultIM = "mozc";
				};
				"Groups/0/Items/0".Name = "keyboard-us";
				"Groups/0/Items/1".Name = "mozc";
			};
		};
	};
}
