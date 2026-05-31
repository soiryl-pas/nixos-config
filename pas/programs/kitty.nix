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
font_family      Unifont Sans-Serif
bold_font        auto
italic_font      auto
bold_italic_font auto
    '';
  };
}
