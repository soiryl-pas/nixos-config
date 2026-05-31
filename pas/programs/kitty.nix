{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "Dracula";    
    font = {
      package = pkgs.unifont;
      name = "Unifont";
    };
  };
}
