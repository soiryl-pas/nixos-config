{ config, lib, pkgs, ... }:
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

    environment.systemPackages = with pkgs; [
      fuzzel
      swaylock
      mako
      waybar
      xwayland-satellite
      swaybg
      networkmanagerapplet
    ];

    systemd.user.services.swaybg = {
      description = "SwayBG Wallpaper for Niri";
      partOf = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      requisite = [ "graphical-session.target" ];

      serviceConfig = {
        ExecStart = ''
          ${pkgs.swaybg}/bin/swaybg \
            -m fill \
            -i %h/pictures/WALLPAPER.png
        '';
        Restart = "on-failure";
      };

      wantedBy = [ "niri.service" ];
    };

    qt = {
      enable = true;
      style = "kvantum";
    };
  };
}
