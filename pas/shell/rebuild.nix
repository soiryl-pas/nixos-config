{ pkgs }:

let
  git = pkgs.git;
in
pkgs.writeShellApplication {
  name = "rebuild-nat";
  text = ''
    pushd "$HOME"/nixos-configuration

    echo -e "\n== HELLO =="
    pwd

    popd
  '';
}
