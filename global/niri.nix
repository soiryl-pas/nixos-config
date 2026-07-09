{ config, lib, pkgs, ... }:
let
  cfg = config.custom;
in {
  options = {
    custom.with-niri = lib.mkEnableOption "Enables the Niri Window Manager and associated user programs.";
  };

  config = lib.mkIf cfg.with-niri {
    programs.niri.enable = true;
    systemd.user.services.niri.enableDefaultPath = false;

    services = {
      gnome.gnome-keyring.enable = true;
    };

    security = {
      polkit.enable = true;
      pam.services.swaylock = {};
    };

    environment.systemPackages = with pkgs; [
      fuzzel
      swaylock
      mako
      swayidle
      waybar
      xwayland-satellite
      swaybg
    ];

    programs.dconf.profiles.user.databases = [
      {
        lockAll = true;
        settings = {
          "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
          };
        };
      }
    ];
  };
}
