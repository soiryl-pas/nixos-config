{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "Dracula";    
    font = {
      package = pkgs.unifont;
      name = "Unifont";
    };
    settings = {
      adjust_cell_width = "-50%";
    };
  };
}
