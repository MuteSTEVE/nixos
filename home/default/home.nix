{ config, pkgs, username, hostname, stateVersion, ... }:

{
	home.username = username;
	home.homeDirectory = "/home/${username}";
	home.stateVersion = stateVersion;

	home.packages = with pkgs; [
		anki
		bluetui
		btop
		fastfetch
		impala
		lazygit
		tree
	];

	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo I use Nixos btw";
		};
	};
}
