{ settings, pkgs, ... }:

with settings;
{
	enable = true;
	settings = {
		global = {
			font = "${font} ${fontSizes.dunst}";
			frame_color = "#${colors.accent}";
			frame_width = "1";
			separator_color = "frame";
			corner_radius = "6";
			offset = "24x24";
		};
		urgency_low = {
			background = "#${colors.background}${opacityHex}";
			foreground = "#${colors.foreground}";
		};
		urgency_normal = {
			background = "#${colors.background}${opacityHex}";
			foreground = "#${colors.foreground}";
		};
		urgency_critical = {
			background = "#${colors.background}${opacityHex}";
			foreground = "#${colors.foreground}";
			frame_color = "#${colors.urgent}";
		};
	};
}
