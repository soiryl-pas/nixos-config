{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./bash.nix
    ./devflakes.nix
  ];

  programs.direnv = {
    enable = true;
  };
}
