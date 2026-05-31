{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "Dracula";    
    /*
    font = {
      name = "Unifont";
    };
    */
    settings = {
    };
    extraConfig = ''
font_family      family="Unifont"
bold_font        auto
italic_font      auto
bold_italic_font auto
modify_font cell_width 1px
adjust_cell_width -50%
    '';
  };
}
