{ nixpkgs, pkgs, ... }:
let
  toKDL = kdl-attrset: import ./nix-to-kdl.nix {
    inherit kdl-attrset;
    inherit (pkgs.util) compose;
  };
  util = (import ./util.nix)
      // { test = pkgs.util.toKDL (import ./test.nix); }
      // { inherit toKDL; };
in {
  nixpkgs.overlays = [
    (_final: _prev: {
      util = util;
    })
  ];
}
