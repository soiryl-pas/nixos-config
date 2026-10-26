{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "Dracula";
    font = {
      name = "Unifont";
      size = 16;
    };
    settings = {
      modify_font = "cell_width 50%";
      cursor = "#b83afc";
    };
  };
}
