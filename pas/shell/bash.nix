{
  config,
  pkgs,
  ...
}: {
  programs.bash = {
    enable = true;
    enableCompletion = true;

    # Aliases
    shellAliases = {
      rm = "rm -i";
    };

    # Environmental Variables
    sessionVariables = {
      PS1 = ''\n \e[1;36m\u\e[m > \e[0;90m\D\e[m > \e[0;35m\w\e[m\n \e[1;36m$\e[m '';
    };

    # Further ~/.bashrc Configs
    bashrcExtra = ''
    '';
  };
}
