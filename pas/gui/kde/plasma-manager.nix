{ config, lib, pkgs, ... }:

{
  programs.plasma = {
    enable = true;
    overrideConfig = true;

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      clickItemTo = "open";
    };

    panels = [
      {
	height = 50;
	location = "right";
      }
    ];
  };
}
