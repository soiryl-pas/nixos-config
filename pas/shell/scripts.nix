{ config, pkgs, ... }:

{
  environment.systemPackages = [
    (import ./rebuild.nix { inherit pkgs; })
  ];
}
