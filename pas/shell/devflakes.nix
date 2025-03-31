{ config, pkgs, ... }:
let
  devshelldir = ".";
in {
  programs.bash.shellAliases = {
    c = "nix develop ${devshelldir}/clang";
  };
}
