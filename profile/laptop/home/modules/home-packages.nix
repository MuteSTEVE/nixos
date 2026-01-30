{ config, pkgs, ... }:

{
	programs.mpv.enable = true;
	home.packages = with pkgs; [
		anki
		bluetui
		btop
		fastfetch
		impala
		lazygit
		localsend
		neovim
		tree
		yazi
	];
}
