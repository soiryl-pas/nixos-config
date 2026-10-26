{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "Dracula";    
    font = {
      name = "Unifont";
      size = 14;
    };
    settings = {
      modify_font = "cell_width 50%";
    };
    /*
    extraConfig = ''
    modify_font cell_width 50%
    '';
    */
  };
}
