{ home, lib, pkgs, ... }:
let
	settings = rec {
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
		# functions
		color = c: "#" + colors."${c}";
		alphaColor = c: (color c) + opacityHex;
	};
	importConfig = conf: (import conf {
		settings = settings;
		pkgs = pkgs;
		lib = lib;
	});
in
{
	programs = {
		home-manager.enable = true;
		btop   = (importConfig ./btop.nix);
		direnv = (importConfig ./direnv.nix);
		foot   = (importConfig ./foot.nix);
		fuzzel = (importConfig ./fuzzel.nix);
		fzf    = (importConfig ./fzf.nix);
		irssi  = (importConfig ./irssi.nix);
		neovim = (importConfig ./neovim.nix);
		waybar = (importConfig ./waybar.nix);
		zsh    = (importConfig ./zsh.nix);
	};
	services.dunst = (importConfig ./dunst.nix);
	wayland.windowManager.hyprland = (importConfig ./hyprland.nix);

	gtk = (importConfig ./gtk.nix);
	qt  = (importConfig ./qt.nix);

	home.file = (importConfig ./etc.nix);

	fonts.fontconfig.enable = true;
}
