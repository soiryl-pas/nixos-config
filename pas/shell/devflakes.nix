{ config, pkgs, ... }:
let
  devshelldir = "/home/pas/nixos-config/pas/shell";
in {
  programs.bash.shellAliases = {
    c = "nix develop ${devshelldir}/clang";
  };
}
