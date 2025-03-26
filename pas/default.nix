{ config, pkgs, inputs, ... }:

{
  home = {
    username = "pas";
    homeDirectory = "/home/pas";
    stateVersion = "24.11"; # Do not change
  };

  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
    ./programs
    ./shell
    ./gui
  ];

  programs.home-manager.enable = true;

  programs.plasma = {
    enable = true;
    overrideConfig = true;
    immutableByDefault = true;
  };
}
