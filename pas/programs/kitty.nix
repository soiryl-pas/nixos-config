{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "Dracula";
    font = {
      name = "Unifont";
      size = 12;
    };
    settings = {
      modify_font = "cell_width 50%";
      cursor = "#c981ef";
    };
  };
}
