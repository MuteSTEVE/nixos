{ config, lib, pkgs, hostvars, ... }:

{
	imports = [
		./modules/audio.nix
		./modules/autogarbage-collection.nix
		./modules/bluetooth.nix
		./modules/bootloader.nix
		./modules/hardware-configuration.nix
		./modules/host-user.nix
		./modules/networking.nix
		./modules/system-packages.nix
	];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
