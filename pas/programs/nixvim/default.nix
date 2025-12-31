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
      fd
      tree-sitter
    ]
    ++ [
      (inputs.nixvim.legacyPackages.${system}.makeNixvim (import ./nixvim-config.nix { inherit pkgs; }))
    ];

  home.shellAliases.vi = "nvim";

  programs.lazygit = {
    enable = true;
    settings = {
      git.pagers.pager = "${pkgs.ydiff}/bin/ydiff -p cat -s --wrap --width={{columnWidth}}";
    };
  };
}
