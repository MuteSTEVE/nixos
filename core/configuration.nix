{ config, lib, pkgs, ... }:

{
	imports = [
		./audio.nix
	 	./hardware-configuration.nix
		./host-user.nix
	];

	boot.loader = {
		efi = { canTouchEfiVariables = true; };
		grub = {
			efiSupport = true;
			efiInstallAsRemovable = false;
			device = "nodev";
		};
	};

	networking.networkmanager.enable = true;

	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	system.stateVersion = "25.11";
}
