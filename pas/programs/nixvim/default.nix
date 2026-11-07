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

  /*
    ++ [
      (inputs.nixvim.legacyPackages.${system}.makeNixvim (import ./nixvim-config.nix { inherit pkgs; }))
    ];
    */

  home.shellAliases.vi = "nvim";

  programs = {
    nixvim = {
      enable = true;
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
