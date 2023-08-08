{ settings, pkgs, ... }:

with settings;
{
	enable = true;
	platformTheme = "gtk";
	style.name = "gtk2";
}
