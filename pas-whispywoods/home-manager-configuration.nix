{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../pas/default-small.nix
  ];

  home.packages = with pkgs; [
    krita
  ];
}
