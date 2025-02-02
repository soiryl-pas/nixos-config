{ config, pkgs, ... }:

{
  programs.nvf = {
    enable = true;
    enableManpages = true;

    settings = {
      vim.options.shiftwidth = 2;
    };
  };

  /*
  vim.languages = {
    nix.enable = true;
    clang.enable = true;
    python.enable = true;
    html.enable = true;
  };
  */
}
