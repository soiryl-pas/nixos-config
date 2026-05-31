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
      modify_font = "cell_width 4px";
    };
  };
}
