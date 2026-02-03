{ config, pkgs, ... }:

{
	programs.mpv = {
		enable = true;
		scripts = with pkgs.mpvScripts; [
			mpvacious
		];

		## Obviously needed by mpvacious
		packages = with pkgs; [
			ffmpeg-full
		];
	};

	xdg.configFile."mpv/config".source = ./mpv-config;
	xdg.configFile."mpv/input.conf".source = ./mpv-input;
}
