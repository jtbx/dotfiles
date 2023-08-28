{ settings, pkgs, ... }:

with settings;
let
	urgencyConfig = {
		background = (alphaColor "background");
		foreground = (color "foreground");
	};
in
{
	enable = true;
	settings = {
		global = {
			font = "${font} ${fontSizes.dunst}";
			frame_color = (color "accent");
			frame_width = "1";
			separator_color = "frame";
			corner_radius = "6";
			offset = "24x24";
		};
		urgency_low = urgencyConfig;
		urgency_normal = urgencyConfig;
		urgency_critical = urgencyConfig // {
			frame_color = (color "urgent");
		};
	};
}
