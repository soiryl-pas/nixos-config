{ config, pkgs, ... }:

{
  programs.nvf = {
    enable = true;
    enableManpages = true;

    #treesitter.context.enable = true;

    settings = {
      vim = {
        options.shiftwidth = 2;
        options.termguicolors = true;
        languages = {
          enableLSP = true;
          enableTreesitter = true;

          nix.enable = true;
          clang.enable = true;
          python.enable = true;
          html.enable = true;
          bash.enable = true;
      };
    };
  };

  };
}
