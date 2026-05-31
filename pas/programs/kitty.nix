{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "Dracula";    
    font = {
      name = "family=Unifont-JP postscript_name=Unifont-JP";
    };
  };
}
