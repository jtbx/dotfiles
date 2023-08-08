{ settings, pkgs, ... }:

with settings;
{
	enable = true;
	cursorTheme = {
		name = "MacOS-Monterey";
		package = pkgs.apple-cursor;
	};
	theme = {
		name = "Catppuccin-Mocha-Standard-Mauve-dark";
		package = pkgs.catppuccin-gtk.override {
			variant = "mocha";
		};
	};
	gtk3.extraConfig.gtk-application-prefer-dark-theme = "1";
	gtk4.extraConfig.gtk-application-prefer-dark-theme = "1";
}
