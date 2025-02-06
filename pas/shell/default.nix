{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./bash.nix
    ./devshells.nix
  ];
}
