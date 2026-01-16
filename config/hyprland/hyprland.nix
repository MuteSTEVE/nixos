{ config, pkgs, ... }:

{
	programs.kitty.enable = true;
	wayland.windowManager.hyprland = {
		enable = true;
	};

	home.pointerCursor = {
		gtk.enable = true;
		package = pkgs.bibata-cursors;
		name = "Bibata-Modern-Classic";
		size = 16;
	};
}
