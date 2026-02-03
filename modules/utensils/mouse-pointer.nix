{ config, pkgs, ... }:

{
	## Fix mouse-cursor to load properly
	home.pointerCursor = {
		gtk.enable = true;
		package = pkgs.bibata-cursors;
		name = "Bibata-Modern-Ice";
		size = 17;
	};
}
