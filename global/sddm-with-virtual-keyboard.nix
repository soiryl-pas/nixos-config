{
  pkgs,
  ...
}: {
  services.displayManager.sddm = {
    settings.General.InputMethod = "maliit-keyboard";
    /*
    extraPackages = with pkgs.kdePackages; [
      qtvirtualkeyboard
    ];
    */

  };
  /*
  systemd.services.display-manager.environment = {
    QT_IM_MODULE = "qtvirtualkeyboard";
  };
  */
}
