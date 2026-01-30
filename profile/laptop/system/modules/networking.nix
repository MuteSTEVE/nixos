{ config, ... }:

## Localsend "receive" port
let
	localsend = 53317;
in

{
	networking = {
		networkmanager = {
			enable = true;
			wifi = {
				backend = "iwd";
				powersave = true;	## Laptop power saving
			};
		};
		firewall = {
			enable = true;
			allowedTCPPorts = [
				localsend
			];
			allowedUDPPorts = [
				localsend
			];

		};
	};
}
