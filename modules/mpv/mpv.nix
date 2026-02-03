{ config, pkgs, ... }:

{
	programs.mpv = {
		enable = true;
		scripts = with pkgs.mpvScripts; [
			mpvacious
		];

	};

	## Obviously needed by mpvacious
	home.packages = with pkgs; [
		ffmpeg-full
	];

	xdg.configFile."mpv/mpv.conf".source = ./mpv-conf;
	xdg.configFile."mpv/input.conf".source = ./mpv-input;
}
