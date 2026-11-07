{
  config,
  pkgs,
  inputs,
  system,
  ...
}:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  home.shellAliases.vi = "nvim";

  programs = {
    nixvim = {
      enable = true;
      nixpkgs.source = inputs.nixpkgs;
    } // (import ./nixvim-config.nix { inherit pkgs; });

    fd.enable = true;
    lazygit = {
      enable = true;
      settings = {
        git.pagers = [
          { pager = "${pkgs.delta}/bin/delta --syntax-theme=Dracula --paging=never"; }
        ];
      };
    };
  };

  home.packages = [
      pkgs.tree-sitter
  ];
}
