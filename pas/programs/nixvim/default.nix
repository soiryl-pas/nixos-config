{ config, pkgs, inputs, system, ... }:

{
  home.packages = with pkgs; [
    lazygit
    fd
    tree-sitter
  ] ++ [
    (inputs.nixvim.legacyPackages.${system}.makeNixvim (import ./nixvim-config.nix { inherit pkgs; }))
  ];
}
