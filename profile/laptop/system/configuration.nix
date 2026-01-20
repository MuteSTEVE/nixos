{ config, lib, pkgs, hostvars, ... }:

{
	imports = [
		./modules/audio.nix
		./modules/autogarbage-collection.nix
		./modules/hardware-configuration.nix
		./modules/bootloader.nix
		./modules/host-user.nix
		./modules/packages.nix
	];

	networking.networkmanager.enable = true;
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
