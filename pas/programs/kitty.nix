{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "Dracula";    
    font = {
      name = "Unifont";
      size = 13;
    };
    settings = {
      modify_font = "cell_width 50%";
    };
  };
}
