{ settings, pkgs, ... }:

with settings;
{
	enable = true;
	package = (pkgs.waybar.override {
		hyprlandSupport = true;
		jackSupport = false;
		mpdSupport = false;
		mprisSupport = false;
		rfkillSupport = false;
		traySupport = false;
		udevSupport = false;
		upowerSupport = false;
	});

	settings =
	let
		barConfig = {
			layer = "top";
			position = "top";
			height = 25;
			margin-top = -25;
			spacing = 16;
		};
	in
	[
		(barConfig // {
			margin-top = 22;
			margin-left = 24;
			margin-right = 1230;
			modules-center = ["wlr/workspaces"];
		
			"wlr/workspaces" = {
				format = "{icon}";
				on-click = "activate";
				sort-by-number = true;
			};
		})
		(barConfig // {
			margin-left = 180;
			margin-right = 950;
			modules-center = ["clock"];
		
			clock = {
				format = "{:%H:%M:%S  |  %d/%m}";
				timezone = "Pacific/Auckland";
				interval = 1;
			};
		})
		(barConfig // {
			margin-left = 350;
			margin-right = 860;
			modules-center = ["cpu"];
			cpu = {
				interval = 4;
				format = "cpu {usage}%";
			};
		})
		(barConfig // {
			margin-left = 435;
			margin-right = 780;
			modules-center = ["memory"];
			memory = {
				interval = 5;
				format = "{used}G";
				max-length = 10;
			};
		})
		(barConfig // {
			margin-left = 520;
			margin-right = 700;
			modules-center = ["pulseaudio"];
		
			pulseaudio = {
				format = "snd {volume}%";
				format-muted = "Mute";
			};
		})
		(barConfig // {
			margin-left = 600;
			margin-right = 580;
			modules-center = ["cava"];
			cava = {
				framerate = 30;
				autosens = 1;
				sensitivity = 100;
				bars = 16;
				lower_cutoff_freq = 50;
				higher_cutoff_freq = 10000;
				method = "pulse";
				source = "auto";
				stereo = true;
				reverse = false;
				bar_delimiter = 0;
				monstercat = false;
				waves = false;
				noise_reduction = 0.77;
				input_delay = 2;
				format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
				actions.on-click-right = "mode";
			};
		})
		(barConfig // {
			margin-left = 720;
			margin-right = 400;
			modules-center = ["disk"];
			disk = {
				interval = 24;
				format = "disk {used} / {total}";
				path = "/";
			};
		})
		(barConfig // {
			margin-left = 900;
			margin-right = 175;
			modules-center = ["network"];
			network = {
				interface = "eno2";
				format-ethernet = "net {bandwidthTotalBytes}  |  ip {ipaddr}";
				format-disconnected = "network disconnected";
			};
		})
		(barConfig // {
			margin-left = 1120;
			margin-right = 25;
			modules-center = ["user"];
			user = {
				format = "up {work_H}h{work_M}m{work_S}s";
				interval = 1;
			};
		})
	];
		style = ''
@define-color base   #1e1e2e;
@define-color mantle #181825;
@define-color crust  #11111b;

@define-color text     #cdd6f4;
@define-color subtext0 #a6adc8;
@define-color subtext1 #bac2de;

@define-color surface0 #313244;
@define-color surface1 #45475a;
@define-color surface2 #585b70;

@define-color overlay0 #6c7086;
@define-color overlay1 #7f849c;
@define-color overlay2 #9399b2;

@define-color blue      #89b4fa;
@define-color lavender  #b4befe;
@define-color sapphire  #74c7ec;
@define-color sky       #89dceb;
@define-color teal      #94e2d5;
@define-color green     #a6e3a1;
@define-color yellow    #f9e2af;
@define-color peach     #fab387;
@define-color maroon    #eba0ac;
@define-color red       #f38ba8;
@define-color mauve     #cba6f7;
@define-color pink      #f5c2e7;
@define-color flamingo  #f2cdcd;
@define-color rosewater #f5e0dc;

* {
	border-radius: 8px;
	font-family: "${font}";
	font-size: ${fontSizes.waybar}pt;
	min-height: 0;
}

window#waybar {
	background: @crust;
	color: @text;
	opacity: ${opacity};
}

#window {
    border-radius: 20px;
    padding-left: 16px;
    padding-right: 16px;
}

#workspaces button {
	min-width: 0;
	color: @text;
}

#workspaces button.active {
	background-color: @base;
	border-color: @crust;
}

#workspaces button.urgent {
	background: @red;
	color: @crust;
}

#workspaces button:hover {
	background: @surface0;
	border-color: @surface0;
}

#cava {
	color: @mauve;
}
	'';
}
