{ config, pkgs, inputs, osConfig, ... }:

{
  home = {
    username = "pas";
    homeDirectory = "/home/pas";
    stateVersion = "24.11"; # Do not change
  };

  manual.manpages.enable = true;

  nix.gc = osConfig.nix.gc;

  imports = [
    ./programs
    ./shell
    ./gui
  ];
}
