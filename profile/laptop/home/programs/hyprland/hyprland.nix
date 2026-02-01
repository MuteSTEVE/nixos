{ config, pkgs, inputs, hostvars, ... }:

{
	imports = [
		./src/fix-mouse-cursor.nix
		./src/hyprland-packages.nix
		./src/keybinds.nix
	];

	wayland.windowManager.hyprland = {
		enable = true;
		xwayland.enable = true;

		settings = {
			## Using pywal16 hyprland color template
			#source = "/home/${hostvars.username}/.cache/wal/colors-hyprland.conf";

			monitor= ",preferred,auto,1";

			"exec-once" =  [
				"waybar &"
				"fcitx5 &"
				"mpris-proxy &"
				#"sh /home/${hostvars.username}/.local/bin/hyprpwp &"
			];

			env = [ 
				"GTK_IM_MODULE,wayland"
				"QT_IM_MODULE,wayland"
				"XMODIFIERS,@im=wayland"
			];

			general = {
				gaps_in = 5;
				gaps_out = 10;
				border_size = 3;
				resize_on_border = false;
				layout = "dwindle";

				#col.active_border = $foreground;
				#col.inactive_border = $background;
			};

			decoration = {
				rounding = 10;
				active_opacity = 1.0;
				inactive_opacity = 1.0;
				shadow = {
					enabled = false;
					range = 4;
					render_power = 3;
					#color = $background;
				};

				blur = {
					enabled = true;
					size = 3;
					passes = 1;
					vibrancy = 0.1696;
				};
			};

			animations = {
				enabled = "yes, please :)";
				bezier = [
					"easeOutQuint,0.23,1,0.32,1"
					"easeInOutCubic,0.65,0.05,0.36,1"
					"linear,0,0,1,1"
					"almostLinear,0.5,0.5,0.75,1.0"
					"quick,0.15,0,0.1,1"
				];

				animation = [
					"global, 1, 10, default"
					"border, 1, 5.39, easeOutQuint"
					"windows, 1, 4.79, easeOutQuint"
					"windowsIn, 1, 4.1, easeOutQuint, popin 87%"
					"windowsOut, 1, 1.49, linear, popin 87%"
					"fadeIn, 1, 1.73, almostLinear"
					"fadeOut, 1, 1.46, almostLinear"
					"fade, 1, 3.03, quick"
					"layers, 1, 3.81, easeOutQuint"
					"layersIn, 1, 4, easeOutQuint, fade"
					"layersOut, 1, 1.5, linear, fade"
					"fadeLayersIn, 1, 1.79, almostLinear"
					"fadeLayersOut, 1, 1.39, almostLinear"
					"workspaces, 1, 1.94, almostLinear, fade"
					"workspacesIn, 1, 1.21, almostLinear, fade"
					"workspacesOut, 1, 1.94, almostLinear, fade"
					"zoomFactor, 1, 7, quick"
				];
			};

			dwindle = {
				pseudotile = true;
				preserve_split = true;
			};

			master = {
				new_status = "master";
			};

			input = {
				kb_layout = "us";
				kb_variant = "";
				kb_model = "";
				kb_options = "";
				kb_rules = "";

				follow_mouse = 1;

				sensitivity = 0;

				touchpad = { natural_scroll = false;
				};
			};

			device = {
				name = "epic-mouse-v1";
				sensitivity = -0.5;
			};

			windowrule = [
				## Ignore maximize requests from apps. You'll probably like this.
				"suppress_event maximize, match:class .*"
			];
		};
	};
}
