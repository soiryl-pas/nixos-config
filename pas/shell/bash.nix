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
    };

    # Further ~/.bashrc Configs
    bashrcExtra = ''
    '';
  };
}
