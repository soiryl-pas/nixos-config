{
  config,
  pkgs,
  ...
}: let
  devshelldir = "/home/pas/nixos-configuration/pas/shell";
in {
  programs.bash.shellAliases = {
    cpp = "nix develop ${devshelldir}/cpp";
  };
}
