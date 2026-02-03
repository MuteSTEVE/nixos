{ config, pkgs, ... }:

{
	wayland.windowManager.hyprland.settings = {
		"$MODKEY" = "SUPER";

		"$TERMINAL" = "kitty";
		"$BROWSER" = "firefox";
		"$FILEXP" = "kitty yazi";
		"$WIFI" = "kitty impala";
		"$MENU" = "rofi -show drun";

		bind = [ 
			"$MODKEY, RETURN, exec, $TERMINAL"
			"$MODKEY, SPACE, exec, $MENU"
			"$MODKEY SHIFT, b, exec, $BROWSER"
			"$MODKEY SHIFT, e, exec, $FILEXP"
			"$MODKEY SHIFT, n, exec, $WIFI"
			"$MODKEY SHIFT, l, exec, $MENU"

			"$MODKEY, c, killactive,"
			"$MODKEY, ESCAPE, exit,"
			"$MODKEY, f, togglefloating,"
			"$MODKEY, p, pseudo, # dwindle"
			"$MODKEY, v, togglesplit, # dwindle"

			## Move focus with MODKEY + vim keys
			"$MODKEY, h, movefocus, l"
			"$MODKEY, d, movefocus, l"
			"$MODKEY, l, movefocus, r"
			"$MODKEY, a, movefocus, r"
			"$MODKEY, k, movefocus, u"
			"$MODKEY, j, movefocus, d"

			## Move window with MODKEY + SHIFT + vim keys
			"$MODKEY SHIFT, h, movewindow, l"
			"$MODKEY SHIFT, j, movewindow, d"
			"$MODKEY SHIFT, k, movewindow, u"
			"$MODKEY SHIFT, l, movewindow, r"

			## Resize window with ALT + SHIFT + vim keys
			"ALT SHIFT, h, resizeactive, -30 0"
			"ALT SHIFT, j, resizeactive, 0 30"
			"ALT SHIFT, k, resizeactive, 0 -30"
			"ALT SHIFT, l, resizeactive, 30 0"

			## Switch workspaces with MODKEY + [0-9]
			"$MODKEY, 1, workspace, 1"
			"$MODKEY, 2, workspace, 2"
			"$MODKEY, 3, workspace, 3"
			"$MODKEY, 4, workspace, 4"
			"$MODKEY, 5, workspace, 5"
			"$MODKEY, 6, workspace, 6"
			"$MODKEY, 7, workspace, 7"
			"$MODKEY, 8, workspace, 8"
			"$MODKEY, 9, workspace, 9"
			"$MODKEY, 0, workspace, 10"

			## Move active window to a workspace with MODKEY + SHIFT + [0-9]
			"$MODKEY SHIFT, 1, movetoworkspace, 1"
			"$MODKEY SHIFT, 2, movetoworkspace, 2"
			"$MODKEY SHIFT, 3, movetoworkspace, 3"
			"$MODKEY SHIFT, 4, movetoworkspace, 4"
			"$MODKEY SHIFT, 5, movetoworkspace, 5"
			"$MODKEY SHIFT, 6, movetoworkspace, 6"
			"$MODKEY SHIFT, 7, movetoworkspace, 7"
			"$MODKEY SHIFT, 8, movetoworkspace, 8"
			"$MODKEY SHIFT, 9, movetoworkspace, 9"
			"$MODKEY SHIFT, 0, movetoworkspace, 10"

			## Special workspace (scratchpad)
			"$MODKEY, S, togglespecialworkspace, magic"
			"$MODKEY SHIFT, S, movetoworkspace, special:magic"

			## Scroll through existing workspaces with MODKEY + scroll
			"$MODKEY, mouse_down, workspace, e+1"
			"$MODKEY, mouse_up, workspace, e-1"
		];

		## Move/resize windows with Mod + LMB/RMB and dragging
		bindm = [
			"$MODKEY, mouse:272, movewindow"
			"$MODKEY, mouse:273, resizewindow"
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
}
