{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "Dracula";    
    /*
    font = {
      package = pkgs.unifont_upper;
      #name = "Unifont";
    };
    */
  };
}
