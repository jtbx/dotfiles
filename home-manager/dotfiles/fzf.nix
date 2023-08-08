{ settings, pkgs, ... }:

with settings;
{
	enable = true;
	enableZshIntegration = true;
	defaultCommand = "find .";

	colors = {
		bg  = "-1"; # default
		fg = "#${colors.foreground}";
		hl = "#${colors.accent}";
		"bg+" = "-1"; # default
		"fg+" = "#${colors.foreground}";
		"hl+" = "#${colors.accent}";
		info = "#${colors.accent}";
		prompt = "#${colors.accent}";
		spinner = "#${colors.accent}";
		header = "#74c7ec";
		pointer = "#f5e0dc";
		marker = "#f5e0dc";
	};
}
