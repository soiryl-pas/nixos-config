{ config, pkgs, ... }:

{
  imports = [
    ./bash.nix
    ./cpp.nix
  ];
}
