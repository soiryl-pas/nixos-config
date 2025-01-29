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
  ];

  programs.home-manager.enable = true;
}
