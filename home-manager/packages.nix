{ pkgs, ... }:
{
	home.packages = with pkgs; [
		asciinema
		betterdiscordctl
		cava
		clang-tools
		cmatrix
		cmus
		ddnet
		entr
		farge
		ffmpeg
		figlet
		firefox
		fuzzel
		gimp
		grim
		groff
		imagemagick
		irssi
		jq
		libnotify
		libresprite
		lldb
		mpg123
		mpv
		nodejs
		oath-toolkit
		obs-studio
		obs-studio-plugins.wlrobs
		onefetch
		polkit_gnome
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
