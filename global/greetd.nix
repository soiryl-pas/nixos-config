{ config, lib, pkgs, ... }:

let
  cfg = config.custom.defaultDisplayManager;
in
{
  config = lib.mkIf (cfg == "greetd") {

    services = {
      xserver.exportConfiguration = true;
      xserver.logFile = lib.mkDefault null;

      greetd = {
	enable = true;
	vt = 7;
	settings = {
	  default_session.command = ''
	    ${pkgs.greetd.tuigreet}/bin/tuigreet \
	    --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions \
	    --xsessions ${config.services.displayManager.sessionData.desktops}/share/xsessions \
	    --time \
	    --asterisks \
	    --user-menu
	  '';
	};
      };
    };

    environment = {
      etc."X11/xinit/xserverrc".source = pkgs.writeShellScript "xserverrc" ''
	exec ${pkgs.xorg.xorgserver}/bin/X ${toString config.services.xserver.displayManager.xserverArgs} "$@"
      '';
      systemPackages = [ pkgs.xorg.xinit ];
    };

    # Override default packages to ensure compatibility
    # -> could potentially break

    security.pam.services.greetd.kwallet = {
      enable = true;
      forceRun = true;
      package = pkgs.kdePackages.kwallet-pam;
    };
    security.pam.services.login.kwallet = {
      enable = true;
      forceRun = true;
    };
  };
}
