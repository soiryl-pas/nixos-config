{ pkgs }:
pkgs.writeShellApplication {
  name = "cdtmp";
  text = ''
    cd "$(mktemp -d)"
  '';
}
