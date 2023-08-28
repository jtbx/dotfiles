{ settings, pkgs, ... }:

with settings;
{
	enable = true;
	aliases = {
		J = "join";
		CN = "connect";
	};
	networks = {
		liberachat = {
			nick = "jtbx";
			server = {
				address = "irc.libera.chat";
				port = 6697;
				autoConnect = true;
			};
			channels = {
				c.autoJoin = true;
				d.autoJoin = true;
				nixos.autoJoin = true;
			};
		};
		quakenet = {
			nick = "jtbx";
			server = {
				address = "irc.quakenet.org";
				port = 6697;
			};
			channels = {
				teeworlds.autoJoin = true;
			};
		};
	};
}
