{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		anki
		bluetui
		btop
		fastfetch
		impala
		lazygit
		tree
	];
}
