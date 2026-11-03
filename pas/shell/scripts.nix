{ config, pkgs, ... }:

{
  environment.systemPackages = [
    (import ./rebuild.nix { inherit pkgs; })
    (import ./cdtmp.nix { inherit pkgs; })
  ];
}
