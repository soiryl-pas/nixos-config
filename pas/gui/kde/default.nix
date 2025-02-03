{ config, lib, pkgs, ... }:

{
  qt = {
    enable = true;
    platformTheme.name = "qt5ct";
    #style.name = "breeze-dark";
  };
}
