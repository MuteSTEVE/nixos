{ config, pkgs, ... }:

{
	wayland.windowManager.hyprland = {
		settings = {
			"$MOD" = "SUPER";
			"$ALT" = "ALT";
			"$SHIFT" = "SHIFT";
			"$PRINT" = "PRINT";

			## Laptop multimedia keys for volume and LCD brightness
			"$VOLUP" = "XF86AudioRaiseVolume";
			"$VOLDOWN" = "XF86AudioLowerVolume";
			"$MUTE" = "XF86AudioMute";
			"$MICMUTE" = "XF86AudioMicMute";

			"$TERM" = "kitty";
			"$BROWSER" = "firefox";
			"$FILEXP" = "kitty yazi";
			"$MENU" = "wofi --dmenu --show drun";

			bind = [ 
				"$MOD, b, exec, $BROWSER"
				"$MOD, Return, exec, $TERM"
				"$MOD, q, killactive,"
				"$MOD, Escape, exit,"
				"$MOD, e, exec, $FILEXP"
				"$MOD, f, togglefloating,"
				"$ALT, d, exec, $MENU"
				"$MOD, p, pseudo, # dwindle"
				"$MOD, v, togglesplit, # dwindle"

				## Move focus with MOD + vim keys
				"$MOD, h, movefocus, l"
				"$MOD, d, movefocus, l"
				"$MOD, l, movefocus, r"
				"$MOD, a, movefocus, r"
				"$MOD, k, movefocus, u"
				"$MOD, j, movefocus, d"

				## Move window with MOD + SHIFT + vim keys
				"$MOD $SHIFT, H, movewindow, l"
				"$MOD $SHIFT, J, movewindow, d"
				"$MOD $SHIFT, K, movewindow, u"
				"$MOD $SHIFT, L, movewindow, r"

				## Resize window with ALT + SHIFT + vim keys
				"$ALT $SHIFT, H, resizeactive, -30 0"
				"$ALT $SHIFT, J, resizeactive, 0 30"
				"$ALT $SHIFT, K, resizeactive, 0 -30"
				"$ALT $SHIFT, L, resizeactive, 30 0"

				## Switch workspaces with MOD + [0-9]
				"$MOD, 1, workspace, 1"
				"$MOD, 2, workspace, 2"
				"$MOD, 3, workspace, 3"
				"$MOD, 4, workspace, 4"
				"$MOD, 5, workspace, 5"
				"$MOD, 6, workspace, 6"
				"$MOD, 7, workspace, 7"
				"$MOD, 8, workspace, 8"
				"$MOD, 9, workspace, 9"
				"$MOD, 0, workspace, 10"

				## Move active window to a workspace with MOD + SHIFT + [0-9]
				"$MOD $SHIFT, 1, movetoworkspace, 1"
				"$MOD $SHIFT, 2, movetoworkspace, 2"
				"$MOD $SHIFT, 3, movetoworkspace, 3"
				"$MOD $SHIFT, 4, movetoworkspace, 4"
				"$MOD $SHIFT, 5, movetoworkspace, 5"
				"$MOD $SHIFT, 6, movetoworkspace, 6"
				"$MOD $SHIFT, 7, movetoworkspace, 7"
				"$MOD $SHIFT, 8, movetoworkspace, 8"
				"$MOD $SHIFT, 9, movetoworkspace, 9"
				"$MOD $SHIFT, 0, movetoworkspace, 10"

				## Special workspace (scratchpad)
				"$MOD, S, togglespecialworkspace, magic"
				"$MOD $SHIFT, S, movetoworkspace, special:magic"

				## Scroll through existing workspaces with MOD + scroll
				"$MOD, mouse_down, workspace, e+1"
				"$MOD, mouse_up, workspace, e-1"
				];

			## Move/resize windows with Mod + LMB/RMB and dragging
			bindm = [
				"$MOD, mouse:272, movewindow"
				"$MOD, mouse:273, resizewindow"
			];

			## Laptop multimedia keys for volume and LCD brightness
			bindel = [
				",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
				",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
				",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
				",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

				",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
				",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
			];

		};
	};
}
