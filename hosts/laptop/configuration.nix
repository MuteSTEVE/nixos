{ config, lib, pkgs, hostvars, ... }:

{
	imports = [
		../../modules/system/audio.nix
		../../modules/system/autogarbage-collection.nix
		../../modules/system/bluetooth.nix
		../../modules/system/bootloader.nix
		../../modules/system/hardware-configuration.nix
		../../modules/system/host-user.nix
		../../modules/system/networking.nix
		../../modules/system/system-packages.nix	## Firefox and Hyprland located here
	];

	environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
