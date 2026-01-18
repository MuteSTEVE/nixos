{ config, hostvars, ... }:

{
	users.users.${hostvars.username} = {
		isNormalUser = true;
		extraGroups = [ "wheel" "networkmanager" ];
	};
	networking.hostName = hostvars.hostname;
	time.timeZone = hostvars.timezone;

	system.stateVersion = hostvars.stateVersion;
}
