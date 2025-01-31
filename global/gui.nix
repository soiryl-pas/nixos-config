{ config, lib, pkgs, ... }:

let
  cfg = config.custom.defaultDisplayManager;
in
{
  options = {
    custom.defaultDisplayManager = lib.mkOption {
      type = lib.types.enum [
	"none"
	"sddm"
	"greetd"
      ];
      default = "none";
      description = ''
	Auswahl des Displaymanagers:
	"none" (TTY mit startx, das xterm startet, und Skripten der einzelnen Desktop Environments)
	"sddm" (von KDE Plasma 6)
	"greetd" (Terminal Display Manager)
      '';
    };
  };

  config = {

    # Desktop Packages
    environment.systemPackages = with pkgs; [
      xorg.xinit
    ];
    
    services = {
      xserver.enable = true;
      xserver.autorun = true;
      desktopManager.plasma6.enable = true;

      xserver.videoDrivers = [ "amdgpu" "modesetting" "fbdev" ];
      
      xserver.displayManager.startx.enable = (cfg == "none");
      displayManager.sddm = rec { 
	enable = (cfg == "sddm");
	wayland.enable = enable;
      };
      greetd = {
	enable = (cfg == "greetd");
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
  };
}
