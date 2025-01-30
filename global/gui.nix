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

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    
    services = {
      xserver.enable = true;
      desktopManager.plasma6.enable = true;
      
      xserver.displayManager.startx.enable = (cfg == "none");
      displayManager.sddm.enable = (cfg == "sddm");
      greetd = {
	enable = (cfg == "greetd");
	settings = {
	  default_session.command = ''
	  ${pkgs.greetd.tuigreet}/bin/tuigreet \
	  --time \
	  --asterisks \
	  --user-menu
	  '';
	};
      };
    };
  };
}
