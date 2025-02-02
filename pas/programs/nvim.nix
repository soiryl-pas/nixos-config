{ config, pkgs, ... }:

{
  programs.nvf = {
    enable = true;
    enableManpages = true;
  };
}
