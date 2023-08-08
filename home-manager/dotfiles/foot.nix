{ settings, pkgs, ... }:

with settings;
{
	enable = true;
	server.enable = true;
	settings = {
		main = {
			font = "${font}:size=${fontSizes.foot}";
			pad = "25x15 center";
			dpi-aware = "no";
		};
		colors = {
			alpha = "${opacity}";
			background = "${colors.background}";
			foreground = "cdd6f4";
			regular0 = "45475a";    # Black
			regular1 = "f38ba8";    # Red
			regular2 = "a6e3a1";    # Green
			regular3 = "f9e2af";    # Yellow
			regular4 = "89b4fa";    # Blue
			regular5 = "cba6f7";    # Magenta
			regular6 = "94e2d5";    # Cyan
			regular7 = "bac2de";    # White
			
			bright0 = "585b70";     # Bright Black
			bright1 = "f38ba8";     # Bright Red
			bright2 = "a6e3a1";     # Bright Green
			bright3 = "f9e2af";     # Bright Yellow
			bright4 = "89b4fa";     # Bright Blue
			bright5 = "cba6f7";     # Bright Magenta
			bright6 = "94e2d5";     # Bright Cyan
			bright7 = "a6adc8";     # Bright White
		};
		mouse.hide-when-typing = "yes";
	};
}
