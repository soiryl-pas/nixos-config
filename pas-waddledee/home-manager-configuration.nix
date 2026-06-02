{ config, pkgs, ... }:
{
  imports = [ ../pas ];

  programs.vscodium.profiles.default.userSettings."window.zoomLevel" = pkgs.lib.mkForce 0;
}
