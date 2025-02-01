{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    vimPlugins.otter-nvim
  ];
}
