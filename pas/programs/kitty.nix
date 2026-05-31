{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "Dracula";    
    font = {
      name = "Unifont";
    };
    settings = {
      adjust_cell_width = "-90%";
    };
  };
}
