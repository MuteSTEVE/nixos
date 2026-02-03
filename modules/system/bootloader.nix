{ config, lib, ... }:

{
	boot.loader = {
		efi = {
			canTouchEfiVariables = true;
		};
		grub = {
			efiSupport = true;
			efiInstallAsRemovable = false;
			device = "nodev";
			useOSProber = false;
		};
		timeout = 5;
	};
}
