{ config, pkgs, ... }:

{
  programs.neovim.plugins = with pkgs; [
    vimPlugins.nvim-treesitter
    vimPlugins.otter-nvim
  ];
}
