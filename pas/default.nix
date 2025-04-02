{ config, pkgs, inputs, ... }:

{
  home = {
    username = "pas";
    homeDirectory = "/home/pas";
    stateVersion = "24.11"; # Do not change
  };

  xsession.numlock.enable = true;

  imports = [
    ./programs
    ./shell
    ./gui
  ];
}
