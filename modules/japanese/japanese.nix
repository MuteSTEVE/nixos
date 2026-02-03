{ config, pkgs, ... }:

{
	imports = [
		./fcitx5.nix
		./japanese-fonts.nix
	];

	home.packages = with pkgs; [
		anki
	];
}
