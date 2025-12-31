{
  config,
  pkgs,
  inputs,
  system,
  ...
}:

{
  home.packages =
    with pkgs;
    [
      tree-sitter
    ]
    ++ [
      (inputs.nixvim.legacyPackages.${system}.makeNixvim (import ./nixvim-config.nix { inherit pkgs; }))
    ];

  home.shellAliases.vi = "nvim";

  programs = {
    fd.enable = true;
    lazygit = {
      enable = true;
      settings = {
        git.pagers = [
          { pager = "${pkgs.delta}/bin/delta --dark --paging=never"; }
        ];
      };
    };
  };
}
