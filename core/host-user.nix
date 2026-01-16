{ config, ... }:

{
	users.users.mutesteve = {
		isNormalUser = true;
		extraGroups = [ "wheel" "networkmanager" ];
	};

	networking.hostName = "hendarto";
	time.timeZone = "Asia/Jakarta";
}
