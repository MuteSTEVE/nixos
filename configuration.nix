{ config, lib, pkgs, ... }:

{
	imports = [ ./hardware-configuration.nix ];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "hendarto";
	networking.networkmanager.enable = true;

	time.timeZone = "Asia/Jakarta";

	i18n.inputMethod = {
		enable = true;
		type = "fcitx5";
		fcitx5.addons = with pkgs; [
			fcitx5
			fcitx5-mozc
			qt6Packages.fcitx5-configtool
		];
	};

	# services.pulseaudio.enable = true;
	services.pipewire = {
		enable = true;
		pulse.enable = true;
	};
	hardware.bluetooth.enable = true;

	users.users.mutesteve = {
		isNormalUser = true;
		extraGroups = [ "wheel" "netdev" ];
	};

	environment.systemPackages = with pkgs; [];

	programs.firefox.enable = true;
	programs.hyprland.enable = true;

	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	system.stateVersion = "25.11";
}
