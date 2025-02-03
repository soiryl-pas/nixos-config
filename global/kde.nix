{ config, lib, pkgs, ... }:

{
  qt = {
    enable = true;
    platformTheme = "kde";
    style = "adwaita-dark";
  };
}
