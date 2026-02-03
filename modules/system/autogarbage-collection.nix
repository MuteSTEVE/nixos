{ config, lib, ... }:

{
	## Automatic updating
	system.autoUpgrade = {
		enable = true;
		dates = "weekly";
	};

	## Automatic cleanup
	nix = {
		gc = {
			automatic = true;
			dates = "daily";
			options = "--delete-older-than 14d";
		};
		settings.auto-optimise-store = true;
	};
}
