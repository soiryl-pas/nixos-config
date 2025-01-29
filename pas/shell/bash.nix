{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    # Aliases
    shellAliases = {
      rm = "rm -i";
    };

    # Environmental Variables
    sessionVariables = {
      PATH = "/home/pas/nixos-configuration/pas/shell/:$PATH";
    };

    # Further ~/.bashrc Configs
    bashrcExtra = ''
    '';
  };
}
