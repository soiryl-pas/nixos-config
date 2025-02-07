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

      binds = {
        cheatsheet.enable = true;
        whichKey.enable = true;
      };
      telescope.enable = true;

      snippets.luasnip.enable = true;

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
        enableExtraDiagnostics = true;

        nix.enable = true;
        markdown.enable = true;
        clang.enable = true;
        python.enable = true;
        html.enable = true;
        bash.enable = true;
      };

      lsp = {
        enable = true;
        formatOnSave = true;
      };

      ui.borders.plugins.nvim-cmp.enable = true;
      autocomplete.nvim-cmp.enable = true;
      autocomplete.nvim-cmp.sourcePlugins = [
        "lspkind"
      ];

      /*
      lsp = {
        lightbulb.enable = false;
        lspSignature.enable = true;
        lsplines.enable = true;
        nvim-docs-view.enable = true;
        otter-nvim.enable = false;
        trouble.enable = true;
      };
      */
    };
  };
}
