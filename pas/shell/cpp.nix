{ config, lib, pkgs, ... }:

{
  home.packages = [
    ( pkgs.runCommand "cpp" {
      buildInputs = with pkgs; [
        clang
      ];
      #nativeBuildInputs = [ pkgs.makeWrapper ];
    } ''
      clang++ -o main "$@"
    '' )
  ];
}
