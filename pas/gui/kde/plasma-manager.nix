{ config, lib, pkgs, ... }:

{
  programs.plasma = {
    enable = true;
    overrideConfig = true;
  };
}
