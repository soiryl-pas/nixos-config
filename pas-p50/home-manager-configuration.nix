{ config, pkgs, ... }:
{
  imports = [ ../pas ];

  programs.vscode.profiles.default.userSettings."window.zoomLevel" = pkgs.lib.mkForce 0;
}
