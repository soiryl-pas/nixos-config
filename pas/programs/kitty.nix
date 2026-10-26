{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "Dracula";
    /*
    font = {
      name = "Unifont";
      size = 12;
    };
    */
    settings = {
      #modify_font = "cell_width 50%";
      cursor = "#c981ef";
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      colors.cursor.cursor = "#c981ef";
      font = {
        normal = {
          family = "Unifont";
          style = "Regular";
        };
        size = 12.0;
      };
    };
    theme = "dracula";
  };
}
