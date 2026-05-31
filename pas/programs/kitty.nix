{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "Dracula";    
    font = {
      package = pkgs.unifont;
      name = "family=Unifont-JP postscript_name=Unifont-JP";
    };
  };
}
