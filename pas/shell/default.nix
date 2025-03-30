{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./bash.nix
  ];

  programs.direnv = {
    enable = true;
  };
}
