{ config, lib, pkgs, hostvars, ... }:

{
	imports = [
		./modules/audio.nix
		./modules/autogarbage-collection.nix
		./modules/bluetooth.nix
		./modules/bootloader.nix
		./modules/hardware-configuration.nix
		./modules/host-user.nix
		./modules/system-packages.nix
	];

	networking.networkmanager.enable = true;
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
