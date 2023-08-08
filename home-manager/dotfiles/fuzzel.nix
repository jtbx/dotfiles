{ settings, pkgs, ... }:

with settings;
{
	enable = true;
	settings = {
		main = {
			font = "${font}:size=${fontSizes.fuzzel}";
			prompt = "> ";
			terminal = "${pkgs.foot}/bin/foot";
			layer = "overlay";
			dpi-aware = "no";
			icons-enabled = "no";

			width = 28;
			inner-pad = 0;
			vertical-pad = 10;
		};
		colors = {
			background = "${colors.background}ff";
			border = "${colors.background}ff";
			text   = "${colors.foreground}ff";
			selection = "${colors.accent}ff";
			match = "${colors.accent}ff";

			selection-text  = "${colors.background}ff";
			selection-match = "${colors.background}ff";
		};
		border = {
			width = 0;
			radius = 20;
		};
	};
}
