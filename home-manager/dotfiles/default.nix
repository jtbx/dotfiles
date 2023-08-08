{ home, pkgs, ... }:
let
	settings = {
		colors = {
			accent = "cba6f7";
			urgent = "f38ba8";
			background = "11111b";
			foreground = "cdd6f4";
		};
		font = "Iosevka Nerd Font";
		fontSizes = {
			dunst  = "10";
			foot   = "9.5";
			fuzzel = "12";
			waybar = "8";
		};
		homeDirectory = "/home/jeremy";
		opacity = "0.9";
		opacityHex = "e6";
	};
	importConfig = conf: (import conf {
		settings = settings;
		pkgs = pkgs;
	});
in
{
	programs = {
		home-manager.enable = true;
		direnv.enable = true;
		foot   = (importConfig ./foot.nix);
		waybar = (importConfig ./waybar.nix);
		fuzzel = (importConfig ./fuzzel.nix);
		fzf    = (importConfig ./fzf.nix);
		zsh    = (importConfig ./zsh.nix);
	};
	services.dunst = (importConfig ./dunst.nix);
	wayland.windowManager.hyprland = (importConfig ./hyprland.nix);

	gtk = (importConfig ./gtk.nix);
	qt  = (importConfig ./qt.nix);

	home.file = (importConfig ./etc.nix);

	home.shellAliases = {
		vi = "nvim";
	};

	fonts.fontconfig.enable = true;
}
