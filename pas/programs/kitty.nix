{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "Dracula";    
    font = {
      name = "Unifont";
      size = 36;
    };
  };
}
