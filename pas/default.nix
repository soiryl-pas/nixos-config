{ config, pkgs, ... }:

{
  home = {
    username = "pas";
    homeDirectory = "/home/pas";
    stateVersion = "24.11"; # Do not change
  };

  imports = [
    ./programs
    ./shell
    ./gui
  ];

  programs.home-manager.enable = true;
}
