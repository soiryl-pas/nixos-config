{ config, lib, pkgs, ... }:

{
  imports = [
    ./plasma-manager.nix
  ];

  qt = {
    enable = true;
    platformTheme.name = "kde";
  };
}
