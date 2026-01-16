{ config, lib, ... }:

{
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
	};
	#services.mpris-proxy.enable = true;
}
