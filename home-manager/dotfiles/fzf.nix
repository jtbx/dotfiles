{ settings, pkgs, lib, ... }:

with settings;
{
	enable = true;
	enableZshIntegration = true;
	defaultCommand = "find .";

	colors = {
		bg  = "-1"; # default
		fg = (color "foreground");
		hl = (color "accent");
		"bg+"   = "-1"; # default
		"fg+"   = (color "foreground");
		"hl+"   = (color "accent");
		info    = (color "accent");
		prompt  = (color "accent");
		spinner = (color "accent");
		header  = "#74c7ec";
		pointer = "#f5e0dc";
		marker  = "#f5e0dc";
	};
}
