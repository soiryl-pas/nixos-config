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
    
    services = {
      xserver.enable = true;
      desktopManager.plasma6.enable = true;
      # TODO Hyprland
      
      xserver.displayManager.startx.enable = (cfg == "none");
      displayManager.sddm.enable = (cfg == "sddm");
      greetd = {
	enable = (cfg == "greetd");
      };
    };
  };
}
