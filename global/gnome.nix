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
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
    };
  };
}
