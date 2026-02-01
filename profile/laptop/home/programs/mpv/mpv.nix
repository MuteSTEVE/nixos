{ config, pkgs, ... }:

{
	imports = [
		./mpv-conf.nix
		./mpv-input.nix
	];

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
}
