{ config, pkgs, ... }:

{
  imports = [
    ./bash.nix
  ];

  home.sessionPath = [
    "$HOME/nixos-configuration/pas/shell/"
  ];
}
