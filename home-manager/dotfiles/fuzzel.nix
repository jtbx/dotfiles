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
		colors =
		let
			opaqueColor = c: (colors."${c}") + "ff";
		in
		{
			background = (opaqueColor "background");
			border     = (opaqueColor "background");
			text       = (opaqueColor "foreground");
			selection  = (opaqueColor "accent");
			match      = (opaqueColor "accent");

			selection-text  = (opaqueColor "background");
			selection-match = (opaqueColor "background");
		};
		border = {
			width = 0;
			radius = 20;
		};
	};
}
