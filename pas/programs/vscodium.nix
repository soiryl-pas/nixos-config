{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = vscodium;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      ms-python.vscode-pylance
    ];
  };
}
