{
  pkgs,
  ...
}: {
  services.displayManager.sddm = {
    settings.General.InputMethod = "qtvirtualkeyboard";
    extraPackages = with pkgs.kdePackages; [
      qtvirtualkeyboard
    ];

  };
  systemd.services.display-manager.environment = {
    QT_IM_MODULE = "qtvirtualkeyboard";
  };
}
