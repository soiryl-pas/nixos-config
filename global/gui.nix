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
	"lightdm"
      ];
      default = "none";
      description = ''
	Auswahl des Displaymanagers:
	"none" (TTY mit startx, das xterm startet, und Skripten der einzelnen Desktop Environments)
	"sddm" (von KDE Plasma 6)
	"greetd" (Terminal Display Manager)
	"lightdm" (Light Display Manager)
      '';
    };
  };

  imports = [
    ./greetd.nix
  ];

  config = {

    programs.sway.enable = true;
    
    # Enable kwallet-pam for tty and qtile sessions as well, depends on:
    ## Plasma enabling pam.service.login.kwallet
    ## interactive Bash shell being used
    # This breaks user service plasma-kwallet-pam.service when starting Plasma, but that shouldn't be too bad
    security.pam.services.login.kwallet.forceRun = true;
    environment.loginShellInit = "QT_QPA_PLATFORM=offscreen ${config.security.pam.services.login.kwallet.package}/libexec/pam_kwallet_init &> /dev/null";
    programs.bash.interactiveShellInit = ''
      if [[ $(tty) =~ 'tty' ]]; then
	export QT_QPA_PLATFORM=offscreen
      fi
    '';

    services = {
      # Xorg Conf
      xserver.enable = true;
      xserver.videoDrivers = [ "amdgpu" "modesetting" "fbdev" ];

      # Desktop Environments / Window Managers / Display Managers
      desktopManager.plasma6.enable = true;
      xserver.windowManager.qtile.enable = true;
      xserver.displayManager.startx.enable = (cfg == "none");
      displayManager.sddm = rec { 
	enable = (cfg == "sddm");
	wayland.enable = enable;
      };
    };
  };
}
