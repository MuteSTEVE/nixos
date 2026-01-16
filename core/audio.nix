{ config, lib, pkgs, ... }:

{
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		pulse.enable = true;
	};

	hardware.bluetooth = {
		enable = true;
		powerOnBoot = true;
	}; 

	## Bluetooth (headset buttons to control media player)
	systemd.user.services.mpris-proxy = {
		description = "Mpris proxy";
		after = [ "network.target" "sound.target" ];
		wantedBy = [ "default.target" ];
		serviceConfig.ExecStart = "mpris-proxy";
		path = with pkgs; [
			bluez
		];
	};
	services.mpris-proxxy.enable = true;
}
