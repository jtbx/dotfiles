{ config, pkgs, ... }:
{
	# File systems
	fileSystems."/boot" = {
		device = "/dev/nvme0n1p1";
		fsType = "vfat";
	};
	fileSystems."/" = {
		device = "/dev/nvme0n1p4";
		fsType = "ext4";
		options = ["rw" "noatime"];
	};

	# Boot loader
	boot.loader = {
		efi.canTouchEfiVariables = false;
		systemd-boot.enable = true;
	};
}
