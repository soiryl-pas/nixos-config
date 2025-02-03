{ config, lib, pkgs, ... }:

{
  programs.plasma = {
    enable = true;
    overrideConfig = true;

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
    };

    panels = [
      {
	height = 50;
	location = "right";
      }
    ];
  };
}
