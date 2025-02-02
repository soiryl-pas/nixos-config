{
  config,
  pkgs,
  ...
}: {
  programs.nvf = {
    enable = true;
    enableManpages = true;

    settings.vim = {
      options.shiftwidth = 2;

      autocomplete.nvim-cmp.enable = true;
      ui.borders.plugins.nvim-cmp.enable = true;

      lsp = {
        enable = true;
        formatOnSave = true;
        lightbulb.enable = true;
        lspSignature.enable = true;
        lsplines.enable = true;
        nvim-docs-view.enable = true;
        otter-nvim.enable = true;
        trouble.enable = true;
      };

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
