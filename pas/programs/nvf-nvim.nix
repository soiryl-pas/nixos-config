{
  config,
  pkgs,
  ...
}: {
  programs.nvf = {
    enable = true;
    enableManpages = true;

    settings.vim = {
      #treesitter.context.enable = true;
      options.shiftwidth = 2;
      lsp.formatOnSave = true;

      theme = {
        enable = true;
        name = "tokyonight";
        style = "moon";
        transparent = true;
      };

      languages = {
        enableLSP = true;
        enableTreesitter = true;
        enableFormat = true;

        nix.enable = true;
        clang.enable = true;
        python.enable = true;
        html.enable = true;
        bash.enable = true;
      };
    };
  };
}
