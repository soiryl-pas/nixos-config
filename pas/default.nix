{ config, pkgs, nvf, ... }:

{
  home = {
    username = "pas";
    homeDirectory = "/home/pas";
    stateVersion = "24.11"; # Do not change
  };

  imports = [
    nvf.homeManagerModules.default
    ./programs
    ./shell
    ./gui
  ];

  programs.home-manager.enable = true;
}
