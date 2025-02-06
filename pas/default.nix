{ config, pkgs, nvf, plasma-manager, ... }:

{
  home = {
    username = "pas";
    homeDirectory = "/home/pas";
    stateVersion = "24.11"; # Do not change
  };

  imports = [
    nvf.homeManagerModules.default
    plasma-manager.homeManagerModules.plasma-manager
    ./programs
    ./shell
    ./gui
  ];

  programs.home-manager.enable = true;
}
