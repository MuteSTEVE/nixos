{ config, lib, pkgs, hostvars, ... }:

{
	imports = [ ./modules/init.nix ];
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
