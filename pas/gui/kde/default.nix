{ config, lib, pkgs, ... }:

{
  qt = {
    enable = true;
    style.name = lib.mkForce "adwaita dark";
  };
}
