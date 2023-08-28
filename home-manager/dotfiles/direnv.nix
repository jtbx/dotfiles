{ settings, pkgs, ... }:

with settings;
{
	enable = true;
	enableZshIntegration = true;
	nix-direnv.enable = true;
}
