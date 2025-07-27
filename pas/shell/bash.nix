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
    };

    # Further ~/.bashrc Configs
    bashrcExtra = ''
      git_branch() {
	git branch --show-current 2> /dev/null
      }
      export PS1="\n \[\e[1;36m\]\u\[\e[m\] > \[\e[0;90m\]\D{%d.%m.%Y %R}\[\e[m\] > \[\e[0;35m\](\w)\[\e[m\] $(git_branch)\n \[\e[1;36m\]$ \[\e[m\]"
    '';
  };
}
