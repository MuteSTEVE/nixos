{ config, pkgs, hostvars, ... }:

{
	imports = [
		./home-packages.nix
		../../modules/hyprland/hyprland.nix
		../../modules/japanese/japanese.nix
		../../modules/kitty/kitty.nix
		../../modules/mpv/mpv.nix
		../../modules/utensils/fonts.nix
		../../modules/utensils/gitconfig.nix
		../../modules/utensils/mouse-pointer.nix
		../../modules/waybar/waybar.nix
	];

	home = {
		username = hostvars.username;
		homeDirectory = "/home/${hostvars.username}";
		stateVersion = hostvars.stateVersion;
	};

	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo I use Nixos btw";
		};
	};
}
