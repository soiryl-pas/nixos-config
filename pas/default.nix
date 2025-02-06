{ config, pkgs, inputs, nvf, ... }:

{
  home = {
    username = "pas";
    homeDirectory = "/home/pas";
    stateVersion = "24.11"; # Do not change
  };

  imports = [
    nvf.homeManagerModules.default
    inputs.plasma-manager.homeManagerModules.plasma-manager
    ./programs
    ./shell
    ./gui
  ];

  programs.home-manager.enable = true;
}
