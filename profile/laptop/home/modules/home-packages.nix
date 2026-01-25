{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		anki
		bluetui
		btop
		fastfetch
		impala
		lazygit
		neovim
		tree
	];
}
