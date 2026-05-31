{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "Dracula";    
    font = {
      name = "Unifont";
      size = 8.0;
    };
    settings = {
    };
  };
}
