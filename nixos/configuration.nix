{ config, pkgs, lib, ... }:
{
	imports = [
		./boot-configuration.nix
		./hardware-configuration.nix
		./packages.nix
	];
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# Networking
	networking = {
		hostName = "mtcook";
		firewall.enable = false;
		networkmanager.enable = true;
	};

	# Sound
	sound.enable = true;

	# Locale
	i18n.defaultLocale = "en_NZ.UTF-8";
	# Timezone
	time.timeZone = "Pacific/Auckland";

	# User and groups setup
	users = {
		defaultUserShell = pkgs.zsh;
		groups = {
			jeremy = {};
		};
		users.jeremy = {
			isNormalUser = true;
			initialPassword = "hellonix";
			description = "Jeremy";
			extraGroups = [ "wheel" "audio" "video" "kvm"
				"usb" "input" "users" "seat" "wsrc" "libvirt" ];
		};
	};

	environment = {
		# Automatically log in to Hyprland
		loginShellInit = ''
			[ "$TTY" = /dev/tty1 ] && Hyprland
		'';
		# Environment variables
		sessionVariables = {
			# Enable Wayland support for most applications
			NIXOS_OZONE_WL = "1";
			SDL_VIDEODRIVER = "wayland";
			GDK_BACKEND = "wayland";
		};
	};

	# Copy the NixOS configuration file and link it from the resulting system
	# (/run/current-system/configuration.nix). This is useful in case you
	# accidentally delete configuration.nix.
	system.copySystemConfiguration = true;
	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It's perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "23.05";
}
