{ settings, pkgs, ... }:

with settings;
{
	".config/cava/config".text = ''
		[color]
		foreground = magenta
	'';
}
