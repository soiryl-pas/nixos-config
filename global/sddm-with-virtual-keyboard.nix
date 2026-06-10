{
  pkgs,
  ...
}: {
  services.displayManager.sddm = {
    settings.Wayland.CompositorCommand = ''
      ${pkgs.kdePackages.kwin}/bin/kwin_wayland --drm --no-lockscreen --no-global-shortcuts --locale1 --inputmethod ${pkgs.maliit-keyboard}/bin/maliit-keyboard
    '';

    extraPackages = with pkgs; [
      maliit-keyboard
      maliit-framework
    ];

  };
  /*
  systemd.services.display-manager.environment = {
    QT_IM_MODULE = "qtvirtualkeyboard";
  };
  */
}
