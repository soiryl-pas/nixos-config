{ config, lib, pkgs, ... }:

{
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    #style.name = "breeze-dark";
  };
}
