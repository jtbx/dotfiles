{ settings, pkgs, ... }:

with settings;
{
	enable = true;
	xwayland.hidpi = true;
	settings = {
		# Constants
		"$modkey" = "SUPER";
		"$resizeinterval" = "64";

		monitor = [
			"eDP-1,1920x1080@60,0x0,1.5"
			",highres,auto,2"
			#"HDMI-A-1,1920x1080@60,0x0,1.5,mirror,eDP-1"
		];
		xwayland.force_zero_scaling = true;

		exec-once = [
			"dunst"
			"waybar"
			"wbg $HOME/.config/wallpaper.png"
		];
		# Appearance
		general = {
			gaps_in = 8;
			gaps_out = 24;
			border_size = 1;
			layout = "master";
			"col.active_border" = "rgb(c6a0f6) rgb(8839ef) 45deg";
			"col.inactive_border" = "rgba(18192600)";
		};
		decoration = {
			rounding = 16;
			drop_shadow = true;
			shadow_range = 16;
			#blur = {
			#	enabled = 1;
			#	size = 8;
			#	passes = 2;
			#	new_optimizations = true;
			#}
			blur = true;
			blur_size = 8;
			blur_passes = 2;
			blur_new_optimizations = true;
			"col.shadow" = "0xffa7caff";
			"col.shadow_inactive" = "0x50000000";
		};
		
		# Animations
		animations = {
			enabled = true;
		
			animation = [
				"windows, 1, 8, default, popin 80%"
				"windowsIn, 1, 8, default"
				"windowsOut, 1, 8, default, popin 80%"
				"windowsMove, 1, 6, default"
				"border, 1, 10, default"
				"borderangle, 1, 8, default"
				"fade, 1, 8, default"
				"workspaces, 1, 4, default"
			];
		};
		
		# Window tiling
		dwindle = {
			pseudotile = true;
			preserve_split = true;
		};
		master.new_is_master = true;
		
		# Keyboard layout
		input.kb_layout = "eu";
		
		# Misc.
		misc = {
			enable_swallow = true;
			swallow_regex = "^(foot)$";
		};

		# Key bindings
		bind = [
			## Applications
			"$modkey, 36, exec, foot"
			"$modkey, C, exec, webcord"
			"$modkey, P, exec, grimblast copy area"
			"$modkey, R, exec, fuzzel"
			"$modkey, W, exec, firefox"
			"$modkey, ;, exec, farge --notify"
			## Sound settings
			"$modkey, f1, exec, pulsemixer --toggle-mute"
			"$modkey, f2, exec, pulsemixer --change-volume -5"
			"$modkey, f3, exec, pulsemixer --change-volume +5"

			## Actions
			
			### Kill active window
			"$modkey, Q, killactive,"
			### Exit Hyprland
			"$modkey SHIFT, Q, exit,"
			### Toggle floating mode
			"$modkey, V, togglefloating,"
			
			### Focus
			"$modkey, J, movefocus, l"
			"$modkey, K, movefocus, r"
			
			### Workspaces
			"$modkey, 1, workspace, 1"
			"$modkey, 2, workspace, 2"
			"$modkey, 3, workspace, 3"
			"$modkey, 4, workspace, 4"
			"$modkey, 5, workspace, 5"
			"$modkey, 6, workspace, 6"
			"$modkey, 7, workspace, 7"
			"$modkey, 8, workspace, 8"
			"$modkey, 9, workspace, 9"
			"$modkey, 0, workspace, 10"
			
			### Move active window to a workspace with modkey + Shift + [0-9]
			"$modkey SHIFT, 1, movetoworkspace, 1"
			"$modkey SHIFT, 2, movetoworkspace, 2"
			"$modkey SHIFT, 3, movetoworkspace, 3"
			"$modkey SHIFT, 4, movetoworkspace, 4"
			"$modkey SHIFT, 5, movetoworkspace, 5"
			"$modkey SHIFT, 6, movetoworkspace, 6"
			"$modkey SHIFT, 7, movetoworkspace, 7"
			"$modkey SHIFT, 8, movetoworkspace, 8"
			"$modkey SHIFT, 9, movetoworkspace, 9"
			"$modkey SHIFT, 0, movetoworkspace, 10"
			
			### Scroll through existing workspaces with modkey + scroll
			"$modkey, mouse_down, workspace, e-1"
			"$modkey, mouse_up, workspace, e+1"
			
			### Resize the active window with modkey + [HLUN]
			"$modkey, H, resizeactive, -$resizeinterval 0"
			"$modkey, L, resizeactive, $resizeinterval 0"
			"$modkey, U, resizeactive, 0 -$resizeinterval"
			"$modkey, N, resizeactive, 0 $resizeinterval"
		];
		
		### Floating resize
		bindm = [
			"$modkey, mouse:273, resizewindow"
			"$modkey, mouse:272, moveactive"
		];
	};
}
