{ config, pkgs, inputs, ... }:

{
  home = {
    username = "pas";
    homeDirectory = "/home/pas";
    stateVersion = "24.11"; # Do not change
  };

  manual.manpages.enable = true;

  programs.nix-index = {
    enable = true;
    enableBashIntegration = true;
  };
  
  imports = [
    ./programs
    ./shell
    ./gui
  ];
}
