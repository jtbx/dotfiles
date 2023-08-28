{ settings, pkgs, lib, ... }:

with settings;
{
	enable = true;
	package = (pkgs.waybar.override {
		hyprlandSupport = true;
		#evdevSupport  = false;
		#inputSupport  = false;
		jackSupport   = false;
		mpdSupport    = false;
		mprisSupport  = false;
		#pulseSupport  = false;
		rfkillSupport = false;
		runTests      = false;
		#sndioSupport  = false;
		swaySupport	  = false;
		traySupport   = false;
		udevSupport   = false;
		upowerSupport = false;
	});

	settings =
	let
		# barConfig - create a single-module bar config
		# using 'module' as the name of the module to use
		# in the bar and 'attrs' as the rest of the attributes
		# included in the bar config. 'attrs.module' is used
		# as the configuration for the bar's only module.
		barConfig = module: attrs: {
			layer = "top";
			position = "top";
			height = 25;
			margin-top = -25;
			spacing = 16;

			modules-center = [ module ];
			"${module}" = attrs.module;
		} // lib.filterAttrs (n: v: n != "module") attrs;
	in
	[
		(barConfig "wlr/workspaces" {
			margin-top = 22;
			margin-left = 24;
			margin-right = 1230;
		
			module = {
				format = "{icon}";
				sort-by-number = true;
			};
		})
		(barConfig "clock" {
			margin-left = 200;
			margin-right = 950;
		
			module = {
				format = "{:%H:%M:%S  |  %d/%m}";
				timezone = "Pacific/Auckland";
				interval = 1;
			};
		})
		(barConfig "cpu" {
			margin-left = 350;
			margin-right = 860;

			module = {
				interval = 4;
				format = "cpu {usage}%";
			};
		})
		(barConfig "memory" {
			margin-left = 435;
			margin-right = 780;

			module = {
				interval = 5;
				format = "{used}G";
				max-length = 10;
			};
		})
		(barConfig "pulseaudio" {
			margin-left = 520;
			margin-right = 700;
		
			module = {
				format = "snd {volume}%";
				format-muted = "Mute";
			};
		})
		(barConfig "cava" {
			margin-left = 600;
			margin-right = 580;

			module = {
				framerate = 60;
				autosens = 1;
				sensitivity = 100;
				bars = 16;
				lower_cutoff_freq = 50;
				higher_cutoff_freq = 10000;
				method = "pipewire";
				source = "pipewire";
				stereo = true;
				reverse = false;
				bar_delimiter = 0;
				monstercat = false;
				waves = false;
				input_delay = 2;
				format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
				actions.on-click-right = "mode";
			};
		})
		(barConfig "disk" {
			margin-left = 720;
			margin-right = 410;

			module = {
				interval = 24;
				format = "disk {used} / {total}";
				path = "/";
			};
		})
		(barConfig "network" {
			margin-left = 890;
			margin-right = 220;

			module = {
				interface = "eno2";
				format-ethernet = "net {bandwidthTotalBytes}  ip {ipaddr}";
				format-disconnected = "network disconnected";
			};
		})
		(barConfig "battery" {
			margin-left = 1080;
			margin-right = 130;

			module = {
				interval = 24;
				format = "bat {capacity}%";
			};
		})
		(barConfig "user" {
			margin-left = 1170;
			margin-right = 25;

			module = {
				format = "up {work_H}h{work_M}m";
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
	font-weight: 900;
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
