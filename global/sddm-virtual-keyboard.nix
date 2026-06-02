{
  pkgs,
  ...
}: {
  services.displayManager.sddm = {
    settings.General.InputMethod = "qtvirtualkeyboard";
    extraPackages = [
      pkgs.kdePackages.qtvirtualkeyboard
    ];
  };

  systemd.services.display-manager.environment = {
    QT_IM_MODULE = "qtvirtualkeyboard";
    QT_VIRTUALKEYBOARD_DESKTOP_DISABLE = "0";
  };
}
