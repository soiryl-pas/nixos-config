{ config, lib, pkgs, nixpkgs, ... }:
let
  cfg = config.custom;
in {
  options = {
    custom.with-niri = lib.mkEnableOption "Enables the Niri Window Manager and associated user programs.";
  };

  config = lib.mkIf cfg.with-niri {
    programs.niri.enable = true;
    programs.dconf.enable = true;
    systemd.user.services.niri.enableDefaultPath = false;

    services = {
      gnome.gnome-keyring.enable = true;
    };

    security = {
      polkit.enable = true;
      pam.services.swaylock = {};
      pam.services.login.enableGnomeKeyring = true;
      pam.services.greetd.enableGnomeKeyring = true;
    };

    environment = {
      systemPackages = with pkgs; [
        fuzzel
        swaylock
        mako
        waybar
        xwayland-satellite
        swaybg
        networkmanagerapplet
        wl-clipboard
        cliphist
        wl-clip-persist
        brightnessctl
        nautilus
      ];

      sessionVariables = {
        QT_QPA_PLATFORMTHEME = "kde";
      };
    };

    systemd.user.services.swaybg = {
      description = "SwayBG Wallpaper for Niri";
      partOf = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      requisite = [ "graphical-session.target" ];

      serviceConfig = {
        ExecStart = ''
          ${pkgs.swaybg}/bin/swaybg \
            -m fill \
            -i %h/pictures/WALLPAPER.png \
            -o DP-8 \
            -m fill \
            -i %h/pictures/WALLPAPER2.png
        '';
        Restart = "on-failure";
      };

      wantedBy = [ "niri.service" ];
    };

    qt = {
      enable = true;
      style = "breeze";
    };

    nixpkgs.overlays = [
      (final: prev: {
        ghidra = prev.symlinkJoin {
          name = "ghidra-nonreparenting";
          paths = [ prev.ghidra ];
          nativeBuildInputs = [ prev.makeWrapper ];
          postBuild = ''
            wrapProgram $out/bin/ghidra \
              --set _JAVA_AWT_WM_NONREPARENTING 1
          '';
        };
      })
    ];
  };
}
