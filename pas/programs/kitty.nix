{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "Dracula";    
    font = {
      name = "Unifont";
    };
    settings = {
    };
    extraConfig = ''
    modify_font cell_width 50%
    '';
  };
}
