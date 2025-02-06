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
        ln -s ${pkgs.bash}/bin/bash $out/bin/cpp-shell
        wrapProgram $out/bin/cpp-shell --prefix PATH : ${pkgs.lib.makeBinPath buildInputs}
      ''
    )
  ];
}
