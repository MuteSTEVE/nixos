{ config, lib, pkgs, hostvars, ... }:

{
	imports = [ ./hardware-configuration.nix ];

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

	networking.hostName = hostvars.hostname;
	networking.networkmanager.enable = true;

	time.timeZone = hostvars.timezone;

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

	users.users.${hostvars.username} = {
		isNormalUser = true;
		extraGroups = [ "wheel" "networkmanager" ];
	};

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
	system.stateVersion = hostvars.stateVersion;
}
