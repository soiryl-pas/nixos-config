{ config, lib, pkgs, ... }:

{
  services = {
    xserver.enable = true;
    # displayManager.sddm.enable = false;
    desktopManager.plasma6.enable = true;
  };

}
