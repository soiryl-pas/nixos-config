{ config, lib, pkgs, ... }:

{
  home.packages = [
    ( let 
        buildInputs = with pkgs; [
          clang
          bash
        ];
      in
        pkgs.runCommand "cpp" {
        inherit buildInputs;
        nativeBuildInputs = [ pkgs.makeWrapper ];
      } ''
        mkdir -p $out/bin/
        ln -s ${pkgs.bash}/bin/sh $out/bin/cpp
        wrapProgram $out/bin/cpp --prefix PATH : ${pkgs.lib.makeBinPath buildInputs}
      ''
    )
  ];
}
