{ config, pkgs, hostvars, ... }:

{
	home = {
		username = hostvars.username;
		homeDirectory = "/home/${hostvars.username}";
		stateVersion = hostvars.stateVersion;
		packages = with pkgs; [
			anki
			bluetui
			btop
			fastfetch
			impala
			lazygit
			tree
		];
	};

	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo I use Nixos btw";
		};
	};

	imports = [
		./modules/hyprland/hyprland.nix
		./modules/fonts.nix
	];
}
