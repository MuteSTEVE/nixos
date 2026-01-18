{ config, lib, pkgs, hostvars, ... }:

{
	imports = [
		./modules/audio.nix
		./modules/autogarbage-collection.nix
		./modules/hardware-configuration.nix
		./modules/host-user.nix
		./modules/input-method.nix
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

	programs.firefox.enable = true;
	programs.hyprland.enable = true;

	environment.systemPackages = with pkgs; [
		git
		hyprpaper
		kitty
		neovim
		wget
	];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
