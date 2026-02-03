{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		bluetui
		btop
		fastfetch
		lazygit
		localsend
		neovim
		tree
		yazi
	];
}
