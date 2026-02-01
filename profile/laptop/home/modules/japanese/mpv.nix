{ config, pkgs, ... }:

{
	programs.mpv = {
		enable = true;
		scripts = with pkgs.mpvScripts; [
			uosc
			mpvacious
		];
	};

	home.packages = with pkgs; [
		ffmpeg-full
	];
}
