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

      lsp = {
        formatOnSave = true;
        lightbulb.enable = true;
        lspSignature.enable = true;
        lspsaga.enable = true;
        lsplines.enable = true;
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
