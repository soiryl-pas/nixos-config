{
  config,
  pkgs,
  inputs,
  ...
}: {
  home = {
    username = "pas";
    homeDirectory = "/home/pas";
    stateVersion = "24.11"; # Do not change
  };

  manual.manpages.enable = true;

  imports = [
    ./programs/default-small.nix
    ./shell
    ./gui
  ];
}
