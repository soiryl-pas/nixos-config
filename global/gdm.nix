{
  config,
  lib,
  ...
}:
let
  cfg = config.custom.defaultDisplayManager;
in {
  config = lib.mkIf (cfg == "gdm") {
    services = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };
}
