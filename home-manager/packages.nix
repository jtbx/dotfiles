{ pkgs, ... }:
{
	home.packages = with pkgs; [
		asciinema
		betterdiscordctl
		cabal-install
		cava
		clang-tools
		cmus
		entr
		farge
		ffmpeg
		figlet
		firefox
		fuzzel
		ghc
		gimp
		grim
		groff
		imagemagick
		jq
		libnotify
		lldb
		mpg123
		mpv
		nodejs
		obs-studio
		obs-studio-plugins.wlrobs
		onefetch
		prismlauncher
		rclone
		slurp
		superTuxKart
		swayimg
		teeworlds
		wbg
		webcord-vencord
		wl-clipboard
		xdg-desktop-portal-hyprland
		yt-dlp
		zathura

		lua54Packages.lua

		(nerdfonts.override {
			fonts = [
				"Iosevka"
				"JetBrainsMono"
				"RobotoMono"
			];
		})
	];
}
