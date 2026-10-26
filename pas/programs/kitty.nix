{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "Dracula";
    font = {
      name = "Cozette";
      package = pkgs.cozette;
      #name = "Unifont";
      #size = 12;
    };
    settings = {
      #modify_font = "cell_width 50%";
      cursor = "#c981ef";
    };
  };
}
