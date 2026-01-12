{ config, lib, pkgs, ... }:

{
	imports = [ ./hardware-configuration.nix ];

	boot.loader.systemd-boot.enable = false;
	boot.loader = {
		efi = {
			canTouchEfiVariables = true;
		};
		grub = {
			efiSupport = true;
			efiInstallAsRemovable = false;
			device = "nodev";
		};
	};

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

	services.pipewire = {
		enable = true;
		pulse.enable = true;
	};
	hardware.bluetooth.enable = true;
	systemd.user.services.mpris-proxy = {
		description = "Mpris proxy";
		after = [ "network.target" "sound.target" ];
		wantedBy = [ "default.target" ];
		serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
	};


	users.users.mutesteve = {
		isNormalUser = true;
		extraGroups = [ "wheel" "netdev" ];
	};

	programs.firefox.enable = true;
	programs.hyprland.enable = true;

	environment.systemPackages = with pkgs; [
		bluez
		fastfetch
		git
		kitty
		neovim
		vim
		wget
	];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	system.stateVersion = "25.11";
}
