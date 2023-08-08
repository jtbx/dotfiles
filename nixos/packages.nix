{ config, pkgs, lib, ... }:
{
	# Packages
	environment = {
		systemPackages = with pkgs; [
			bmake
			clang
			cmake
			curl
			dub
			gcc
			git
			home-manager
			ldc
			lua
			man-pages
			man-pages-posix
			ncurses
			neofetch
			neovim
			pulsemixer
			tree-sitter
			unzip
			vim
			virt-manager
			wget
 			zip
		];
		shellAliases = {
			make = "bmake";
			vi = "nvim";
		};
		variables = {
			EDITOR = "nvim";
		};
	};
	programs = {
		hyprland.enable = true;
		zsh = {
			enable = true;
			enableCompletion = true;
			syntaxHighlighting.enable = true;
			autosuggestions.enable = true;
		};
	};
	security = {
		rtkit.enable = true;
		polkit.enable = true;
	};
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};
	virtualisation.libvirtd = {
		enable = true;
		qemu.runAsRoot = false;
	};
}
